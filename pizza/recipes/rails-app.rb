app_name = ckattr("pizza.app_name", node["pizza"]["app_name"], String)
repository = ckattr("pizza.repository", node["pizza"]["repository"], String)
secret_key_base = ckattr("pizza.secret_key_base", node["pizza"]["secret_key_base"], String)
username = ckattr("pizza.username", node["pizza"]["username"], String)
deploy_to = ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)

rails_env = "staging"

git deploy_to do
  action :sync
  group username
  repository repository
  user username
end

execute "bundle_install" do
  command "/opt/rbenv/shims/bundle install --deployment -j4 --without development test"
  cwd deploy_to
  group username
  user username
end

if node["pizza"]["assets_precompile"]
  execute "bower_install" do
    command "/usr/local/bin/bower install"
    creates "#{deploy_to}/vendor/assets/components"
    cwd deploy_to
    group username
    user username
  end

  execute "npm_install" do
    command "/usr/local/bin/npm install"
    creates "#{deploy_to}/node_modules"
    cwd deploy_to
    group username
    user username
  end

  execute "webpack_production" do
    command "/usr/local/bin/webpack -p --config webpack.config.prod.js"
    creates "#{deploy_to}/app/assets/javascripts/bundle/app-bundle.js"
    environment({ "NODE_ENV" => "production" })
    cwd deploy_to
    group username
    user username
  end
end

database_url = ckattr("pizza.database_url", node["pizza"]["database_url"], String)
template "#{deploy_to}/config/database.yml" do
  variables database_url: database_url
end

secret_key_base = ckattr("pizza.secret_key_base", node["pizza"]["secret_key_base"], String)
template "#{deploy_to}/config/secrets.yml" do
  variables secret_key_base: secret_key_base
end

if node["pizza"]["assets_precompile"]
  execute "assets_precompile" do
    command "/opt/rbenv/shims/bundle exec rake assets:precompile"
    creates "#{deploy_to}/public/assets"
    cwd deploy_to
    environment({ "RAILS_ENV" => rails_env })
    group username
    user username
  end
end

directory "#{deploy_to}/tmp/pids" do
  group username
  user username
end

app_name = ckattr("pizza.app_name", node["pizza"]["app_name"], String)
deploy_to = ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)
unicorn_worker_count = ckattr("pizza.unicorn_worker_count", node["pizza"]["unicorn_worker_count"], Integer)
template "#{deploy_to}/config/unicorn.rb" do
  variables app_name: app_name, deploy_to: deploy_to, unicorn_worker_count: unicorn_worker_count
end

deploy_to = ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)
username = ckattr("pizza.username", node["pizza"]["username"], String)
template "/etc/init.d/unicorn_#{app_name}" do
  group "root"
  mode "0755"
  owner "root"
  source "unicorn_init.erb"
  variables deploy_to: deploy_to, rails_env: rails_env, username: username
end

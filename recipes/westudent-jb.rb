username = node["pizza"]["username"]
database_url = node["pizza"]["database_url"]
repository = node["pizza"]["repository"]
secret_key_base = node["pizza"]["secret_key_base"]

deploy_to = "/home/#{username}/app"

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

template "#{deploy_to}/config/database.yml" do
  variables database_url: database_url
end

template "#{deploy_to}/config/secrets.yml" do
  variables secret_key_base: secret_key_base
end

execute "assets_precompile" do
  command "/opt/rbenv/shims/bundle exec rake assets:precompile"
  creates "#{deploy_to}/public/assets"
  cwd deploy_to
  environment({ "RAILS_ENV" => "staging" })
  group username
  user username
end

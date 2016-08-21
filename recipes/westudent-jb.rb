username = node["pizza"]["username"]
deploy_to = "/home/#{username}/app"

git deploy_to do
  action :sync
  group username
  repository node["pizza"]["repository"]
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
  command "/usr/local/bin/webpack -p"
  creates "#{deploy_to}/app/assets/javascripts/bundle/app-bundle.js"
  cwd deploy_to
  group username
  user username
end

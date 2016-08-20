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

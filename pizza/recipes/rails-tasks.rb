deploy_to = ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)
username = ckattr("pizza.username", node["pizza"]["username"], String)
consul_user = 'consul'

template "/home/#{username}/db_migrate.sh" do
  source 'rails/db_migrate.sh.erb'
  group consul_user
  mode "0755"
  owner consul_user
  variables deploy_to: deploy_to
end

# consul_watch 'db-migrate' do
#   type 'event'
#   parameters(handler: "/home/#{username}/db_migrate.sh",name:'db-migrate')
#   notifies :reload, 'consul_service[consul]', :delayed
# end
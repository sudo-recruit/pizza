deploy_to = ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)
username = ckattr("pizza.username", node["pizza"]["username"], String)
consul_user = 'consul'
include_recipe "consul::default"

# install sifter
# Helps to prevent Consul from firing prematurely.
include_recipe "golang::default"
node.default['go']['packages'] = [ "github.com/darron/sifter"]
include_recipe "golang::packages"


# db migrate
template "/home/#{username}/db_migrate.sh" do
  source 'rails/db_migrate.sh.erb'
  group consul_user
  mode "0755"
  owner consul_user
  variables deploy_to: deploy_to, username: username
end

consul_watch 'db-migrate' do
  type 'event'
  parameters(handler: "/opt/go/bin/sifter run -e  '/home/#{username}/db_migrate.sh'",name:'db-migrate')
  notifies :reload, 'consul_service[consul]', :delayed
end

file "/home/#{username}/migrate.log" do
  owner username
  group username
  content ""
  mode '0666'
end

directory "/home/#{username}/config" do
  group username
  user username
  mode '0750'
end

include_recipe "consul_template::default"
%w(dadatata_url dadatata_token).each do |filename|
  consul_template "#{filename}.json" do
    content "{{ key \"service/rails_sudo/next/#{filename}\" }}"
    destination "/home/#{username}/config/#{filename}"
    notifies :restart, 'consul_template_service[consul-template]', :delayed
  end
end

# for test
# template "/home/#{username}/test.sh" do
#   source 'rails/test.sh.erb'
#   group consul_user
#   mode "0755"
#   owner consul_user
#   variables deploy_to: deploy_to
# end

# consul_watch 'foo-test' do
#   type 'event'
#   parameters(handler: "/home/#{username}/test.sh",name:'foo-test')
#   notifies :reload, 'consul_service[consul]', :delayed
# end

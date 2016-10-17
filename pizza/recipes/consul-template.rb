app_name = ckattr("pizza.app_name", node["pizza"]["app_name"], String)
deploy_to = ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)
username = ckattr("pizza.username", node["pizza"]["username"], String)

root = "root"

include_recipe "consul_template::default"

directory "#{deploy_to}/config" do
  group "consul-template"
  owner "consul-template"
end

group 'root' do
  action :modify
  members "consul-template"
  append true
end

file "#{deploy_to}/config/application.yml" do
  content ""
  group "consul-template"
  owner "consul-template"
end

ckattr("pizza.consul.key_dir", node["pizza"]["consul"]["key_dir"], String)
consul_template "application_yaml.json" do
  source "application.ctmpl.erb"
  destination "#{deploy_to}/config/application.yml"
  command "service unicorn_#{app_name} restart"
  notifies :restart, 'consul_template_service[consul-template]', :delayed
end

ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)
template "/usr/local/bin/prepare-consul-template.sh" do
  group root
  mode "0755"
  owner root
  variables deploy_to: deploy_to
end

cookbook_file "/usr/local/bin/setup-consul.py" do
  group root
  mode "0755"
  owner root
end

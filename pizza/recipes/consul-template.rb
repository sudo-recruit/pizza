app_name = ckattr("pizza.app_name", node["pizza"]["app_name"], String)
deploy_to = ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)
username = ckattr("pizza.username", node["pizza"]["username"], String)

root = "root"

include_recipe "consul-template::default"

ckattr("pizza.consul.key_dir", node["pizza"]["consul"]["key_dir"], String)
consul_template_config "application_yaml" do
  templates [{
    source: "#{deploy_to}/config/application.ctmpl",
    destination: "#{deploy_to}/config/application.yml",
    command: "service unicorn_#{app_name} restart"
  }]
  notifies :reload, 'service[consul-template]', :delayed
end

ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)
template "/usr/local/bin/prepare-consul-template.sh" do
  group root
  mode "0755"
  owner root
  variables deploy_to: deploy_to
end

cookbook_file "/usr/local/bin/generate-consul-template.py" do
  group root
  mode "0755"
  owner root
end

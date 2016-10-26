app_name = ckattr("pizza.app_name", node["pizza"]["app_name"], String)

include_recipe "nginx::source"

ckattr("pizza.app_name", node["pizza"]["app_name"], String)
ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)

# Since Ruby does not have `Boolean` class
enable_ssl = node["pizza"]["enable_ssl"]
if !enable_ssl.is_a?(TrueClass) && !enable_ssl.is_a?(FalseClass)
  Chef::Application.fatal!("attribute pizza.enable_ssl is undefined")
end
if enable_ssl
  ckattr("pizza.ssl_cert", node["pizza"]["ssl_cert"], String)
  ckattr("pizza.ssl_key", node["pizza"]["ssl_key"], String)
end

template "/etc/nginx/sites-enabled/#{app_name}" do
  group "root"
  mode "0644"
  owner "root"
  source "nginx.conf.erb"
end

include_recipe "pizza::monit"

monit_config "nginx" do
  source "monit_nginx.conf.erb"
end

include_recipe "consul_template::default"
consul_template "nginx_app.json" do
  source "nginx.conf.ctmpl.erb"
  destination "/etc/nginx/sites-enabled/#{app_name}"
  command "service nginx restart"
  notifies :restart, 'consul_template_service[consul-template]', :delayed
end

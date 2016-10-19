app_name = ckattr("pizza.app_name", node["pizza"]["app_name"], String)
deploy_to = ckattr("pizza.deploy_to", node["pizza"]["deploy_to"], String)
username = ckattr("pizza.username", node["pizza"]["username"], String)

root = "root"

package "libcurl4-openssl-dev"

template "/etc/security/limits.conf" do
  group root
  mode "0700"
  owner root
  source "limits.conf.erb"
end

include_recipe "td-agent::default"

directory "/etc/td-agent/conf.d" do
  group 'td-agent'
  user 'td-agent'
  mode '0775'
end

group 'td-agent' do
  action :modify
  members root
  append true
end

%w(production.log staging.log).each do |filename|
  file "#{deploy_to}/log/#{filename}" do
    owner username
    group username
    content ""
  end
end

consul_template "td_agent_rails.json" do
  source "td-agent_rails.ctmpl.erb"
  destination "/etc/td-agent/conf.d/td-agent_rails.conf"
  command "service unicorn_#{app_name} restart"
  notifies :restart, 'consul_template_service[consul-template]', :delayed
end

consul_template "td_agent_nginx.json" do
  source "td-agent_nginx.ctmpl.erb"
  destination "/etc/td-agent/conf.d/td-agent_nginx.conf"
  command "service unicorn_#{app_name} restart"
  notifies :restart, 'consul_template_service[consul-template]', :delayed
end

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
  group root
  user root
end

%w(production.log staging.log).each do |filename|
  file "#{deploy_to}/log/#{filename}" do
    owner username
    group username
    content ""
  end
end

template "/etc/td-agent/conf.d/td-agent_rails.conf" do
  group root
  mode "0704"
  owner root
  source "td-agent_rails.conf.erb"
end

template "/etc/td-agent/conf.d/td-agent_nginx.conf" do
  group root
  mode "0704"
  owner root
  source "td-agent_nginx.conf.erb"
end

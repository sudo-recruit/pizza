package 'libcurl4-openssl-dev'

template "/etc/security/limits.conf" do
  owner "root"
  group "root"
  mode "0700"
  source "limits.conf.erb"
end

include_recipe "td-agent::default"


directory '/etc/td-agent/conf.d' do
  group 'root'
  user 'root'
end

template "/etc/td-agent/conf.d/td-agent_rails.conf" do
  owner "root"
  group "root"
  mode "0704"
  source "td-agent_rails.conf.erb"
end

template "/etc/td-agent/conf.d/td-agent_nginx.conf" do
  owner "root"
  group "root"
  mode "0704"
  source "td-agent_nginx.conf.erb"
end
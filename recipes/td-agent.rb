package 'libcurl4-openssl-dev'

template "/etc/security/limits.conf" do
  owner "root"
  group "root"
  mode "0700"
  source "limits.conf.erb"
end

include_recipe "td-agent::default"

template "/etc/td-agent/td-agent.conf" do
  owner "root"
  group "root"
  mode "0704"
  source "td-agent.conf.erb"
end

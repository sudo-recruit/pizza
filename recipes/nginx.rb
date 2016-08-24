app_name = node["pizza"]["app_name"]

include_recipe "nginx::source"

template "/etc/nginx/sites-enabled/#{app_name}" do
  group "root"
  mode "0644"
  owner "root"
  source "nginx.conf.erb"
end

include_recipe "poise-monit"

monit_config "nginx" do
  source "monit_nginx.conf.erb"
end

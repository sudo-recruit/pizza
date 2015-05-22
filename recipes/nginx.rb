include_recipe "nginx::source"
template "/etc/nginx/sites-enabled/#{node['pita']['rails_app_name']}" do
  owner "root"
  group "root"
  mode "0777"
  source "nginx.conf.erb"
end

template "/etc/nginx/sites-enabled/nginx_monit" do
  owner "root"
  group "root"
  mode "0777"
  source "nginx_monit.erb"
end

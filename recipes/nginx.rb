include_recipe "apt"
include_recipe "nginx::source"

app_name=node['pita']['rails_app_name']
if app_name!=nil&&app_name.length>0
  template "/etc/nginx/sites-enabled/#{app_name}" do
    owner "root"
    group "root"
    mode "0777"
    source "nginx.conf.erb"
  end
end

include_recipe "pita::monit"

monit_config 'nginx' do
  source "monit_nginx.conf.erb"
end

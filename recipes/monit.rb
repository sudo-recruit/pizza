include_recipe "monit::default"

template "/etc/monit/conf.d/nginx.conf" do
  owner "root"
  group "root"
  mode "0700"
  source "monit_nginx.conf.erb"
  notifies :restart, "service[monit]",:delayed
end

# template "/etc/monit/conf.d/redis.conf" do
#   owner "root"
#   group "root"
#   mode "0700"
#   source "monit_redis.conf.erb"
#   notifies :restart, "service[monit]",:delayed
# end

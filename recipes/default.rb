::Chef::Recipe.send(:include, Pita::Helpers)

include_recipe "apt"
include_recipe "yum"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "2.2.0" do
  global(true)
end
rbenv_gem "bundler" do
	ruby_version "2.2.0"
end
# node.default['nginx']['version']='1.6.0'
node.default['nginx']['source']['version']='1.6.2'
node.default['nginx']['source']['url']="http://nginx.org/download/nginx-1.6.2.tar.gz"
node.default['nginx']['source']['checksum']="b5608c2959d3e7ad09b20fc8f9e5bd4bc87b3bc8ba5936a513c04ed8f1391a18"



include_recipe "nginx::source"
package 'nodejs'
package 'imagemagick'
package 'libmagickwand-dev'
package 'libmysqlclient-dev'
package 'curl'
package 'git'
package 'vim'

include_recipe "monit::default"

template "/etc/monit/conf.d/nginx.conf" do
  owner "root"
  group "root"
  mode "0700"
  source "monit_nginx.conf.erb"
  notifies :restart, "service[monit]",:delayed
end

template "/etc/security/limits.conf" do
  owner "root"
  group "root"
  mode "0700"
  source "limits.conf.erb"
end

# include_recipe "td-agent::default"


# Array(node["rackbox"]["apps"]["unicorn"]).each_with_index do |app, index|
#   default_port = node["rackbox"]["upstream_start_port"]["unicorn"].to_i + index
#   app_dir      = ::File.join(node["appbox"]["apps_dir"], app["appname"], 'current')

#   setup_nginx_site(app, app_dir, default_port)
#   setup_unicorn_config(app, app_dir, default_port)
#   setup_unicorn_runit(app, app_dir)
# end

# sudo apt-get install imagemagick

# sudo apt-get install libmagickwand-dev

# sudo apt-get install libmysqlclient-dev

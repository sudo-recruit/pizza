::Chef::Recipe.send(:include, Pita::Helpers)

include_recipe "apt"
include_recipe "yum"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

package 'libffi-dev'

rbenv_ruby "2.2.0" do
  global(true)
end
rbenv_gem "bundler" do
	ruby_version "2.2.0"
end

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

include_recipe "td-agent::default"

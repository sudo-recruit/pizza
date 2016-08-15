include_recipe "apt"

apt_repository 'git' do
  uri        'ppa:git-core/ppa'
  distribution 'trusty'
end

git_client 'default' do
  action :install
  # package_version  '1:2.7.4-0ppa1~ubuntu14.04.1'
end

include_recipe "pita::monit"
include_recipe "pita::nginx"
include_recipe "pita::ruby"

include_recipe "nodejs::default"
include_recipe "nodejs::npm"
nodejs_npm "vtop"

package 'imagemagick'
template "/etc/ImageMagick/policy.xml" do
  source "imagemagick_policy.xml.erb"
end

package 'libmagickwand-dev'
package 'libmysqlclient-dev'
package 'curl'
package 'vim'
include_recipe "unattended_upgrades"

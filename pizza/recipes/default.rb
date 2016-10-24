include_recipe "apt"
include_recipe "unattended_upgrades"

package "git"

# setting rails env variable
template "/usr/local/bin/set_rails_env.sh" do
  group 'root'
  mode "0755"
  owner 'root'
end

include_recipe "pizza::consul"
include_recipe "pizza::nginx"
include_recipe "pizza::ruby"
include_recipe "pizza::nodejs"

if node["pizza"]["with_app"] == "true"
  include_recipe "pizza::ssh"
  include_recipe "pizza::rails-app"
  include_recipe "pizza::rails-tasks"
  include_recipe "pizza::consul-template"
  include_recipe "pizza::td-agent"
  include_recipe "pizza::newrelic"
end

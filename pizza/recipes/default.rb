include_recipe "apt"
include_recipe "unattended_upgrades"

package "git"

include_recipe "pizza::consul"
include_recipe "pizza::nginx"
include_recipe "pizza::ruby"
include_recipe "pizza::nodejs"

if node["pizza"]["with_app"] == "true"
  include_recipe "pizza::ssh"
  include_recipe "pizza::rails-app"
  include_recipe "pizza::consul-template"
end

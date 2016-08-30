include_recipe "apt"
include_recipe "unattended_upgrades"

package "git"

include_recipe "pizza::consul"
include_recipe "pizza::nginx"
include_recipe "pizza::ruby"
include_recipe "pizza::nodejs"
include_recipe "pizza::ssh"

if node["pizza"]["with_app"]
  include_recipe "pizza::rails-app"
  include_recipe "pizza::consul_template"
end
include_recipe "apt"

package "git"

# include_recipe "pizza::monit"
# include_recipe "pizza::nginx"
include_recipe "pizza::ruby"

# include_recipe "nodejs::default"
# include_recipe "nodejs::npm"

# include_recipe "unattended_upgrades"

include_recipe "pizza::ssh"
include_recipe "pizza::westudent-jb"

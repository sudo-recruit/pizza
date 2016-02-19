include_recipe "apt"
include_recipe "pita::monit"
include_recipe "pita::nginx"
include_recipe "pita::ruby"

include_recipe "nodejs::default"
include_recipe "nodejs::npm"
nodejs_npm "vtop"

package 'imagemagick'
package 'libmagickwand-dev'
package 'libmysqlclient-dev'
package 'curl'
package 'git'
package 'vim'
include_recipe "unattended_upgrades"



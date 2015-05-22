include_recipe "apt"
include_recipe "yum"
include_recipe "pita::nginx"
include_recipe "pita::monit"
include_recipe "pita::ruby"
include_recipe "pita::td-agent"

include_recipe "nodejs::default"
include_recipe "nodejs::npm"
nodejs_npm "vtop"

package 'imagemagick'
package 'libmagickwand-dev'
package 'libmysqlclient-dev'
package 'curl'
package 'git'
package 'vim'
package 'redis-server'


include_recipe "datadog::dd-agent"

name "pizza"
version "0.1.0"
maintainer "henry40408"
maintainer_email "henry.wu@sudo.com.tw"
license  "MIT"
supports "ubuntu"
description "Chef cookbook to cook Ruby on Rails project in Sudo"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))

depends "apt"
depends "consul"
depends "consul-template"
# depends "datadog"
# depends "git"
depends "nginx", "~> 2.7.6"
depends "nodejs"
depends "poise-monit"
# depends "poise-service"
depends "rbenv"
depends "ssh_known_hosts"
depends "sudo_consul_service"
# depends "td-agent"
depends "unattended_upgrades"
# depends "unicorn"

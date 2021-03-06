name "pizza"
version "2.0.6"
maintainer "henry40408"
maintainer_email "henry.wu@sudo.com.tw"
license  "MIT"
supports "ubuntu"
description "Chef cookbook to cook Ruby on Rails project in Sudo"
long_description File.read(File.join(File.dirname(__FILE__), "..", "README.md"))

depends "apt"
depends "consul"
depends "consul_template"
depends "nginx", "~> 2.7.6"
depends "nodejs"
depends "poise-monit"
depends "rbenv"
depends "ssh_known_hosts"
depends "sudo_consul_service"
depends "td-agent"
depends "unattended_upgrades"
depends 'golang', '~> 1.7.0'
depends 'newrelic', '~> 2.22.3'
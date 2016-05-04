name "pita"
version "0.1.14"
maintainer "ocowchun"
maintainer_email "ocowchun@gmail.com"
license  "MIT"
supports "ubuntu"
description "install all dependencies for sudo rails app"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))

depends 'rbenv'
depends 'nginx'
depends 'apt'
depends 'yum'
depends 'unicorn'
depends 'poise-service', '~> 1.1.1'
depends 'poise-monit'
depends 'td-agent'
depends 'nodejs'
depends 'datadog', '~> 2.2.0'
depends 'unattended_upgrades'
depends 'consul', '~> 1.4.3'
depends 'consul-template', '~> 0.9.1'
depends 'sudo_consul_service', '~> 0.0.4'
depends 'git', '~> 4.3.7'
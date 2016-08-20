default["apt"]["unattended_upgrades"]["enable"] = true

default["consul"]["version"] = "0.5.2"

default["monit"]["allow"] = ["localhost","admin:monit","0.0.0.0/0.0.0.0"]

default["nginx"]["source"]["checksum"] = "b5608c2959d3e7ad09b20fc8f9e5bd4bc87b3bc8ba5936a513c04ed8f1391a18"
default["nginx"]["source"]["modules"] = %w(
  nginx::http_ssl_module
  nginx::http_gzip_static_module
  nginx::http_stub_status_module
)
default["nginx"]["source"]["url"] = "http://nginx.org/download/nginx-1.6.2.tar.gz"
default["nginx"]["source"]["version"] = "1.6.2"

default["td_agent"]["api_key"] = "foo_bar"
default["td_agent"]["plugins"] = %w(elasticsearch s3)
default["td_agent"]["version"] = "2"
default["td_agent"]["includes"] = true

default["pita"]["consul"]["node_name"] = "node1"
default["pita"]["deploy_to"] = "/home/ubuntu/apps"
default["pita"]["enable_ssl"] = false
default["pita"]["monit_password"] = "monit3345678"
default["pita"]["monit_port"] = "3737"
default["pita"]["monit_user"] = "admin"
default["pita"]["moro"] = { "processes" => [], "interval" => 30, "datadog" => false }
default["pita"]["rails_app_name"] = "foobar"
default["pita"]["ruby"]["version"] = "2.3.0"
default["pita"]["user_name"] = "ubuntu"

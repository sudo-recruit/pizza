default["apt"]["unattended_upgrades"]["enable"] = true

default["consul"]["config"]["advertise_addr"] = "192.168.33.10"
default["consul"]["config"]["node_name"] = "node1"
default["consul"]["config"]["start_join"] = %w(192.168.33.11) # IP address of host machine from Vagrant
default["consul"]["version"] = "0.5.2"

default["monit"]["allow"] = %w(localhost admin:monit 0.0.0.0/0.0.0.0)

default["nginx"]["source"]["checksum"] = "b5608c2959d3e7ad09b20fc8f9e5bd4bc87b3bc8ba5936a513c04ed8f1391a18"
default["nginx"]["source"]["modules"] = %w(
  nginx::http_ssl_module
  nginx::http_gzip_static_module
  nginx::http_stub_status_module
)
default["nginx"]["source"]["url"] = "http://nginx.org/download/nginx-1.6.2.tar.gz"
default["nginx"]["source"]["version"] = "1.6.2"

default["nodejs"]["install_method"] = "binary"
default["nodejs"]["version"] = "5.10.0"
default["nodejs"]["binary"]["checksum"]["linux_x64"] = "a458ddab5f8d071c9b4f24ccfa685aedd57ccf7338c3ea0e2b99546cf35a3958"

default["pizza"]["app_name"] = "app"
default["pizza"]["consul"]["node_name"] = "node1"
default["pizza"]["deploy_to"] = "/home/ubuntu/app"
default["pizza"]["enable_ssl"] = false
default["pizza"]["ruby"]["version"] = "2.3.0"
default["pizza"]["unicorn_worker_count"] = 5
default["pizza"]["username"] = "ubuntu"
default["pizza"]["with_app"] = true

# unused attributes

default["td_agent"]["api_key"] = "foo_bar"
default["td_agent"]["plugins"] = %w(elasticsearch s3)
default["td_agent"]["version"] = "2"
default["td_agent"]["includes"] = true

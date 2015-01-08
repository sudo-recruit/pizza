# # default["pita"]["ruby"]["versions"] = %w(1.9.3-p385)
# # default["pita"]["ruby"]["global_version"] = "1.9.3-p385"
# # default["pita"]["upstream_start_port"]["unicorn"] = 10001
# # default["pita"]["upstream_start_port"]["passenger"] = 20001

# default["pita"]["default_config"]["nginx"]["template_name"] = "nginx_vhost.conf.erb"
# default["pita"]["default_config"]["nginx"]["template_cookbook"] = "pita"
# default["pita"]["default_config"]["nginx"]["listen_port"] = "80"

# default["pita"]["default_config"]["unicorn"]["listen_port_options"] = { :tcp_nodelay => true, :backlog => 100 }
# default["pita"]["default_config"]["unicorn"]["worker_timeout"] = 60
# default["pita"]["default_config"]["unicorn"]["preload_app"] = false
# default["pita"]["default_config"]["unicorn"]["worker_processes"] = [node[:cpu][:total].to_i * 4, 8].min
# default["pita"]["default_config"]["unicorn"]["before_fork"] = 'sleep 1'

# default["pita"]["default_config"]["unicorn_runit"]["template_name"] = "unicorn"
# default["pita"]["default_config"]["unicorn_runit"]["template_cookbook"] = "pita"
# default["pita"]["default_config"]["unicorn_runit"]["rack_env"] = "production"

# # default["pita"]["default_config"]["passenger_runit"]["template_name"] = "passenger"
# # default["pita"]["default_config"]["passenger_runit"]["template_cookbook"] = "pita"
# # default["pita"]["default_config"]["passenger_runit"]["rack_env"] = "production"
# # default["pita"]["default_config"]["passenger_runit"]["max_pool_size"] = 6
# # default["pita"]["default_config"]["passenger_runit"]["min_instances"] = 1
# # default["pita"]["default_config"]["passenger_runit"]["spawn_method"] = "smart-lv2"
# # default["pita"]["default_config"]["passenger_runit"]["host"] = "localhost"

# default["pita"]["apps"]["unicorn"] = []
# default["pita"]["apps"]["passenger"] = []

# set['nginx']['init_style'] = "init"
default['nginx']['version']='1.6.0'
# default['nginx']['source']['version']='1.6.0'
default["monit"]["allow"]=["localhost","admin:monit","0.0.0.0/0.0.0.0"]
default["td_agent"]["api_key"]="foo_bar"
default["td_agent"]["version"] = '2'


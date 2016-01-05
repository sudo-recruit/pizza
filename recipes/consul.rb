node.default['consul']['config']['node_name'] = node['pita']['consul']['node_name']
# node.default['consul']['config']['start_join'] = node['pita']['consul']['start_join']

include_recipe "sudo_consul::default"

consul_definition "rails_#{node['pita']['rails_app_name']}" do
  type 'service'
  parameters(tags: %w{rails}, address: '127.0.0.1', port: 80)
  notifies :reload, 'consul_service[consul]', :delayed
end


consul_definition 'rails_alive' do
  type 'check'
  parameters(name:'rails alive',http: 'http://localhost/live', interval: '10s',timeout: "1s")
  notifies :reload, 'consul_service[consul]', :delayed
end

include_recipe "sudo_consul_service::required_reboot"

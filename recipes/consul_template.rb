include_recipe "consul-template::default"

template "#{node['pita']['deploy_to']}/shared/application.ctmpl" do
  source "application.ctmpl.erb"
  owner "#{node['pita']['user_name']}"
  group "#{node['pita']['user_name']}"
end

consul_template_config 'rails' do
  templates [{
               source: "#{node['pita']['deploy_to']}/shared/application.ctmpl",
               destination: "#{node['pita']['deploy_to']}/shared/config/application.yml",
               command: "service unicorn_#{node['pita']['rails_app_name']} restart"
  }]
  notifies :reload, 'service[consul-template]', :delayed
end
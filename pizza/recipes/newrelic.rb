include_recipe "newrelic::default"

include_recipe "consul_template::default"
consul_template "nrsysmond_cfg.json" do
  source "nrsysmond.cfg.ctmpl.erb"
  destination "/etc/newrelic/nrsysmond.cfg"
  command "service newrelic-sysmond restart"
  notifies :restart, 'consul_template_service[consul-template]', :delayed
end
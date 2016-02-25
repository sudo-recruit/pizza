require 'json'
pita_ruby_version=node['pita']['ruby']['version']
user_name=node['pita']['user_name']

rbenv_gem "moro" do
  ruby_version pita_ruby_version
  version "0.0.10"
end

directory '/etc/moro' do
end

template "/etc/moro/config.json" do
  mode "0777"
  source "moro.config.json.erb"
  variables :content=>JSON.generate(node['pita']['moro'])
end

poise_service 'moro' do
  command "moro start --config /etc/moro/config.json"
  user user_name
  environment PATH:'/opt/rbenv/shims:/opt/rbenv/bin:/usr/local/bin:/usr/bin:/bin'
end

deploy_to = node["pizza"]["deploy_to"]
username = node["pizza"]["username"]
root = "root"

include_recipe "consul-template::default"

template "#{deploy_to}/config/application.ctmpl" do
  group username
  owner username
end

template "/usr/local/bin/prepare-consul-template.sh" do
  group root
  mode "0755"
  owner root
  variables deploy_to: deploy_to
end

cookbook_file "/usr/local/bin/generate-consul-template.rb" do
  group root
  mode "0755"
  owner root
end

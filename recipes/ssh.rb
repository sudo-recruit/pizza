username = node["pizza"]["username"]
ssh_key_content = node["pizza"]["ssh_key"]

ssh_known_hosts_entry "github.com"

directory "/home/#{username}/.ssh" do
  group username
  mode "0711"
  owner username
end

file "/home/#{username}/.ssh/id_rsa" do
  content ssh_key_content
  group username
  mode "0600"
  owner username
end

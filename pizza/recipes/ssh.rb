username = ckattr("pizza.username", node["pizza"]["username"], String)
ssh_key_content = ckattr("pizza.ssh_key", node["pizza"]["ssh_key"], String)

ssh_known_hosts_entry "github.com"

directory "/home/#{username}/.ssh" do
  group username
  mode "0711"
  owner username
end

file "/home/#{username}/.ssh/id_rsa" do
  content ssh_key_content.gsub("\\n", "\n")
  group username
  mode "0600"
  owner username
end

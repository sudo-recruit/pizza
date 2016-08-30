#!/usr/bin/env ruby
require "json"

CONSUL_JSON = "/etc/consul/consul.json"

if ARGV.size < 2
  puts "usage: ruby gen-consul-template.rb [consul_machine_ip] [consul_server_ip]"
  exit 1
end

consul_content = File.read(CONSUL_JSON)
consul_config = JSON.parse(consul_content)

consul_config["advertise_addr"] = ARGV[0]
consul_config["start_join"][0] = ARGV[1]

pretty_config = JSON.pretty_generate(consul_config)
puts pretty_config

File.open(CONSUL_JSON, "w") { |file| file.write(pretty_config) }

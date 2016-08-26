#!/usr/bin/env ruby
require "json"

if ARGV.size < 2
  puts "usage: ruby gen-consul-template.rb [consul_machine_ip] [consul_server_ip]"
  exit 1
end

consul_content = File.read("/etc/consul/consul.json")
consul_config = JSON.parse(consul_content)

consul_config["advertise_addr"] = ARGV[0]
consul_config["start_join"][0] = ARGV[1]

puts JSON.pretty_generate(consul_config)

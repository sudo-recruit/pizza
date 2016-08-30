#!/usr/bin/env python
import json
import sys

CONSUL_JSON = "/etc/consul/consul.json"

if len(sys.argv) < 2:
    print("usage: ruby gen-consul-template.rb [consul_machine_ip] [consul_server_ip]")
    sys.exit(1)

with open(CONSUL_JSON) as f:
    consul_content = f.read()
    consul_config = json.loads(consul_content)

    consul_config["advertise_addr"] = sys.argv[1]
    consul_config["start_join"][0] = sys.argv[2]

    pretty_config = json.dumps(consul_config, indent=4, sort_keys=True)
    print(pretty_config)

with open(CONSUL_JSON, "w") as f:
    f.write(pretty_config)

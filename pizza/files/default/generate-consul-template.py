#!/usr/bin/env python
import argparse
import json

CONSUL_JSON = "/etc/consul/consul.json"

parser = argparse.ArgumentParser(description="consul.json generator")
parser.add_argument("machine_ip", type=str, help="IP address of this machine")
parser.add_argument("consul_server_ip", type=str, help="IP address of consul server")

args = parser.parse_args()

with open(CONSUL_JSON) as f:
    consul_content = f.read()
    consul_config = json.loads(consul_content)
    consul_config["advertise_addr"] = args.machine_ip
    consul_config["start_join"][0] = args.consul_server_ip

with open(CONSUL_JSON, "w") as f:
    pretty_config = json.dumps(consul_config, indent=4, sort_keys=True)
    print(pretty_config)
    f.write(pretty_config)

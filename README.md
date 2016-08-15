# Pita

> Rails environment cookbook

## How to contribute

* Pita is self-referenced in `Berksfile`, so don't forget to run `berks update` to synchronize version number in `Berksfile.lock`.

## Recipes

### pita::default

Install `ruby`, `monit`, `nginx`, `nodejs`, `mysql-client`, and `imagemagick`

* `['pita']['enable_ssl']` - enable SSL? (default: false)

### pita::consul

Install [consul](https://www.consul.io/) for service discovery

* `['consul']['config']['node_name']` - your consul node name (i.e. `my_rails_app1`)
* `['consul']['config']['start_join']` - ip to join when consul start

### pita::consul_template

Install `consul-template` and build `application.yml`

* `['pita']['consul']['key_dir']` - consul key value dir to store your data

### pita::td-agent

Install [td-agent](https://www.consul.io/) to for logging centralization

* `['pita']['s3_region']` - your s3 region (i.e. `ap-northeast-1`)
* `['pita']['s3_bucket']` - your s3 bucket name (i.e. `my-s3-bucket`)     

### pita::datadog

Install [datadog](https://www.datadoghq.com/) to monitor your infrastructure

### pita::statsd

Install [moro](https://github.com/sudo-recruit/moro) to monitor process memory usage

* `['pita']['moro']` - your [moro](https://github.com/sudo-recruit/moro) config

#### example

```ruby
default['pita']['moro'] = {
  "processes" => [{ "name" => "my_awesome_server", "pid" => "/tmp/pids/server.pid" }],
  "interval" => 30,
  "datadog" => false
}
```

## Authors and Contributors

* [ocowchun](ocowchun@gmail.com)

## License

MIT

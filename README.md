# Pizza

> Chef cookbook to build Ruby on Rails project in Sudo

## How to contribute

* Pizza is self-referenced in `Berksfile`, so don't forget to run `berks update` to synchronize version number in `Berksfile.lock`.

## Recipes

### pizza::default

Install `ruby`, `monit`, `nginx`, `nodejs`, `mysql-client`, and `imagemagick`

* `["pizza"]["enable_ssl"]` - enable SSL? (default: false)

### pizza::consul

Install [consul](https://www.consul.io/) for service discovery

* `["consul"]["config"]["node_name"]` - your consul node name (i.e. `my_rails_app1`)
* `["consul"]["config"]["start_join"]` - ip to join when consul start

### pizza::consul_template

Install `consul-template` and build `application.yml`

* `["pizza"]["consul"]["key_dir"]` - consul key value dir to store your data

### pizza::td-agent

Install [td-agent](https://www.consul.io/) to for logging centralization

* `["pizza"]["s3_region"]` - your s3 region (i.e. `ap-northeast-1`)
* `["pizza"]["s3_bucket"]` - your s3 bucket name (i.e. `my-s3-bucket`)     

### pizza::datadog

Install [datadog](https://www.datadoghq.com/) to monitor your infrastructure

### pizza::statsd

Install [moro](https://github.com/sudo-recruit/moro) to monitor process memory usage

* `["pizza"]["moro"]` - your [moro](https://github.com/sudo-recruit/moro) config

#### example

```ruby
default["pizza"]["moro"] = {
  "processes" => [{ "name" => "my_awesome_server", "pid" => "/tmp/pids/server.pid" }],
  "interval" => 30,
  "datadog" => false
}
```

## Authors and Contributors

* [henry40408](henry.wu@sudo.com.tw)
* [ocowchun](ocowchun@gmail.com) - main maintainer of [Pita](https://github.com/sudo-recruit/pita) project

## License

MIT

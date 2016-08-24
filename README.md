# Pizza

> Chef cookbook to build Ruby on Rails project in Sudo, inherited from [Pita](https://github.com/sudo-recruit/pita) project

## How to contribute

* Pizza is self-referenced in `Berksfile`, so don't forget to run `berks update` to synchronize version number in `Berksfile.lock`.

## Recipes

### pizza::default

Install `ruby`, `nginx`, `nodejs`, `mysql-client`, and `imagemagick`

* `["pizza"]["enable_ssl"]` `boolean` enable SSL? (default: false)

### pizza::consul

Install [consul](https://www.consul.io/) for service discovery

* `["consul"]["config"]["node_name"]` `string` node name of consul in application machine (i.e. `my_rails_app1`)
* `["consul"]["config"]["start_join"]` `array(string)` IP address to join when consul start

### pizza::consul_template

Install `consul-template` and build `application.yml`

* `["pizza"]["consul"]["key_dir"]` `string` consul key value directory to store your data

### pizza::td-agent

Install [td-agent](https://www.consul.io/) to for logging centralization

* `["pizza"]["s3_region"]` `string` your AWS S3 region (i.e. `ap-northeast-1`)
* `["pizza"]["s3_bucket"]` `string` your AWS S3 bucket name (i.e. `my-s3-bucket`)     

### pizza::datadog

Install [datadog](https://www.datadoghq.com/) to monitor your infrastructure

### pizza::statsd

Install [moro](https://github.com/sudo-recruit/moro) to monitor process memory usage

* `["pizza"]["moro"]` `hash` [moro](https://github.com/sudo-recruit/moro) config of application machine

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

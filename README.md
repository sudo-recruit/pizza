# Pizza

> Chef cookbook to build Ruby on Rails project in Sudo, inherited from [Pita](https://github.com/sudo-recruit/pita) project

## Contribution Note

* Pizza is self-referenced in `Berksfile`, so don't forget to run `berks update` to synchronize version number in `Berksfile.lock`.

### Duplicate in Local Machine

If you want to duplicate the entire environment on local machine, please follow the following steps.

#### Download consul

Download and install consul. For macOS, use [Homebrew](http://brew.sh/): `brew install consul`.

#### Start consul on Vagrant host (your machine)

Start consul in development mode.

```shell
$ consul agent -ui -bootstrap -server -dc='dc1' -data-dir=$PWD -bind=$VAGRANT_IP_DEFAULT_GATEWAY
```

* `$PWD` is what it is, you don't have to modify it.
* If IP address of Vagrant machine created by Kitchen is `192.168.33.10`, `$VAGRANT_IP_DEFAULT_GATEWAY` is usually `192.168.33.1`. Actually, `192.168.33.10` is the default value of `.kitchen.yml`, so you can merely replace it with `192.168.33.1`.

#### Prepare consul key/value pairs

Navigate to consul web interface, i.e. `http://127.0.0.1:8500/ui/#/dc1/kv/`. Prepare your key/value pairs, such as `HOST` and `SECRET_KEY_BASE`, to be injected into `application.yml`.

#### Log into the Vagrant guest

In the root of Pizza project.

```shell
# On host
$ kitchen login

# On guest
vagrant@default-ubuntu-1404:~$ sudo /usr/local/bin/prepare-consul-template.sh $CLIENT_IP $SERVER_IP
# This step would be little longer than you expected due to unicorn, but it's fine

# Then you would have `application.yml` for the application
vagrant@default-ubuntu-1404:~$ cat app/config/application.yml
```

* `$CLIENT_IP` is IP address of target machine acting as consul **client** node, i.e. `192.168.33.10` (default value).
* `$SERVER_IP` is IP address of consul **server** node, i.e. `192.168.33.1` (default value).

#### Open the Browser

Navigate to IP address of guest, i.e. `http://192.168.33.10/`, the website should be online now.

## Recipes

> sorted in execution order

Recipe | Description
--- | ---
`recipes/consul.rb` | Install [consul](https://www.consul.io/) and register two health checks.
`recipes/consul_template.rb` | Prepare two files: `prepare-consul-template.sh` and `generate-consul-template.rb`. The former one takes two arguments: 'IP address of consul client' (i.e. `192.168.1.10`) and 'IP address of consul server' (i.e. `192.168.1.1`, then the second one would be invoked and replace `advertise_addr` and `start_join` in consul configuration file `/etc/consul/consul.json` to make the node join the consul cluster.
`recipes/nginx.rb` | Install [nginx](https://nginx.org/). Prepare virtual host and configuration file for [monit](https://mmonit.com/monit/).
`recipes/ruby.rb` | Install [rbenv](https://github.com/rbenv/rbenv), Ruby, [ImageMagick](http://www.imagemagick.org/script/index.php), MySQL client library, and related libraries to run Ruby on Rails application.
`recipes/nodejs.rb` | Install [nodejs](https://nodejs.org/en/), [bower](https://bower.io/), and [webpack](https://webpack.github.io/).
`recipes/ssh.rb` | Inject SSH key from environment variable of CI to target machine, which allows the machine access private repository.
`recipes/westudent-jb.rb` | Do A LOT OF things about the application. First, it clones the repository from GitHub. Then run `bundle install`, `bower install`, and `npm install`. Then run `webpack` in production mode to prepare frontend assets. Then preapre `database.yml` and `secrets.yml`<sup>1</sup>. Then precompile assets for Ruby on Rails application. Then creates `tmp/pids` directory for [unicorn](https://unicorn.bogomips.org/). Then create unicorn configuration file.

<sup>1</sup> The content of `secrets.yml` would be injected by consul after the instance starts, as well as `database.yml` in the near future.

## Attributes

> sorted in alphabetic order, attributes provided by third-party cookbooks are omitted

Attribute | Type | Description
--- | --- | ---
`node["pizza"]["app_name"]` | `string` | Human-readable name of application, i.e. `app`.
`node["pizza"]["consul"]["node_name"]` | `string` | consul node name, i.e. `app_node1`.
`node["pizza"]["deploy_to"]` | `string` | Destination directory which the application is deployed.
`node["pizza"]["enable_ssl"]` | `boolean` | Whether enable SSL or not. Usually `false` for `staging` environment.
`node["pizza"]["ruby"]["version"]` | `string` | Version of Ruby used by the application, i.e. `2.3.0`.
`node["pizza"]["unicorn_worker_count"]` | `integer` | Number of unicorn workers to prefork.
`node["pizza"]["username"]` | `string` | Ordinary username of target machine, i.e. `ubuntu` for Vagrant and Ubuntu AMI.

## Authors and Contributors

* [henry40408](henry.wu@sudo.com.tw)
* [ocowchun](ocowchun@gmail.com) - main maintainer of [Pita](https://github.com/sudo-recruit/pita) project

## License

MIT

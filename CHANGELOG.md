## Unreleased

#2.0.18
* add update sitemap task.

#2.0.17
* use cmtpl for nginx.conf

#2.0.16
* update nginx config, add_header Access-Control-Allow-Origin *;
* add newrelic recipes.

#2.0.15
* use sifter to prevent Consul from firing prematurely

# 2.0.14
* update `config` file mode

# 2.0.13
* update db_migrate.sh
* update rails log file mode
* add user `consul`  to group `ubuntu`
* complete db migrate task

# 2.0.12
* fix td-agent restart service
* fix db_migrate.sh variable error
* add tails-tasks to default recipes

# 2.0.11

* set consul-template default user and group as root.

# 2.0.10

* use consul event to run db migrate

# 2.0.9

* add set_rails_env.sh to set rails environment

# 2.0.8

* add sidekiq.

# 2.0.7

* adjust `unicorn_init` permission to make consul-template can restart it.

# 2.0.6

* use `consul-template` service to generate `application.yml`

# 2.0.5

* use `consul_template_config` resource to manage consul templates

# 2.0.4

* attach tags on AMIs

# 2.0.3

* support CI via `packer-ci.json`

# 2.0.2

* fix bug: write consul configuration to `/etc/consul/consul.json`

# 2.0.1

* separate README for Packer configuration and cookbook

# 2.0.0

* add configuration file for Packer to make AMI
* refactor project structure

# 1.1.1

* reduce instances' memory usage
* put database URI in `consul` key/value store

# 1.1.0

* put `consul` in a Vagrant instance
* add `elasticsearch` instance in Vagrant

# 1.0.2

* minor modification on `monit` configuration file

# 1.0.1

* update `.kitchen.yml`

# 1.0.0

* disable other recipes such as monitoring services to focus on testing ruby recipe
* prepare a `Gemfile` for Kitchen
* rename `pita` to `pizza` and update related project information
* re-enable `apt` cookbook
* in build stage
    * trust GitHub host keys
    * support inject customized SSH keys
    * run `bundle install` in repository
    * make sure to use `gem` from `rbenv` cookbook
    * install `node.js`
    * install `webpack` and `bower` as global packages
    * run `bower install`, `npm install`, and `webpack` (in `production` mode)
    * inject `application.yml` from consul key/value pair

# 0.1.0

* forked from [pita](https://github.com/sudo-recruit/pita) project, focused on building Chef cookbook to build Ruby on Rails project in Sudo.

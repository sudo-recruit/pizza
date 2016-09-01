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

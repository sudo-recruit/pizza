## 1.0.0

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

## 0.1.0

* forked from [pita](https://github.com/sudo-recruit/pita) project, focused on building Chef cookbook to build Ruby on Rails project in Sudo.

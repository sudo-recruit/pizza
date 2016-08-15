##0.1.16
* remove unnecessary `yum` package because we use Ubuntu
* not restrict version number of `git`

##0.1.15
* upgrade consul-template gem to 0.10.0

##0.1.14
* handle CVE-2016–3714

##0.1.13
* install git v2.7.4

##0.1.12
* upgrade moro gem to 0.0.10

##0.1.11
* [pr1 add moro recipe](https://github.com/sudo-recruit/pita/pull/1)

##0.1.10
* extract `application.ctmpl`'s data to attributes

##0.1.9
* replace `monit` cookbook with `poise-monit`
* extract monit nginx to `nginx` recipes
* only add `nginx.conf` when `rails_app_name` exist

##0.1.8
* refactor `consul`

##0.1.7
* use ruby 2.3 as default version

##0.1.6
* use logstash_dateformat %Y.%m. for elastic search

##0.1.5
* adjust td-agent recipes to add config

##0.1.4
* add [datadog](https://github.com/DataDog/chef-datadog) recipes

##0.1.3
* add `enable_ssl` to decide whether to enable ssl

##0.1.2
* add [consul](https://www.consul.io/) recipes

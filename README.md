#Pita
>rails environment cookbook

##Recipes

###pita::default
install `ruby`, `monit`,`nginx`,`nodejs`,`mysql-client`,`imagemagick`

###pita::consul
install [consul](https://www.consul.io/) for service discovery
* `['consul']['config']['node_name']` - your consul node name (i.e. `my_rails_app1`)
* `['consul']['config']['start_join']` - ip to join when consul start


###pita::td-agent
install [td-agent](https://www.consul.io/) to unified logging

* `['pita']['s3_region']` - your s3 region (i.e. `ap-northeast-1`)
* `['pita']['s3_bucket']` - your s3 bucket name (i.e. `my-s3-bucket`)     




##Authors and Contributors
* [ocowchun](ocowchun@gmail.com)

MIT
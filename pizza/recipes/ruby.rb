pizza_ruby_version = ckattr("pizza.ruby.version", node["pizza"]["ruby"]["version"], String)

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

package "imagemagick"

template "/etc/ImageMagick/policy.xml" do
  source "imagemagick_policy.xml.erb"
end

package "libffi-dev"
package "libmagickwand-dev"
package "libmysqlclient-dev"

rbenv_ruby pizza_ruby_version do
  global true
end

rbenv_gem "bundler" do
  ruby_version pizza_ruby_version
end

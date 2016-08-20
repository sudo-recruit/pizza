include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

package "imagemagick"

template "/etc/ImageMagick/policy.xml" do
  source "imagemagick_policy.xml.erb"
end

package "libffi-dev"

pita_ruby_version = node["pita"]["ruby"]["version"]

rbenv_ruby pita_ruby_version do
  global true
end

rbenv_gem "bundler" do
  ruby_version pita_ruby_version
end

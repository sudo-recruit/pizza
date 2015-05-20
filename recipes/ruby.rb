include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

package 'libffi-dev'

rbenv_ruby "2.2.0" do
  global(true)
end

rbenv_gem "bundler" do
  ruby_version "2.2.0"
end

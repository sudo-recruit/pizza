include_recipe "apt"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

  rbenv_ruby "2.0.0-p576" do
    global(true)
  end
  rbenv_gem "bundler" do
    ruby_version "2.0.0-p576"
  end

include_recipe "nginx::source"

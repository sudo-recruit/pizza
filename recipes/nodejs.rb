include_recipe "nodejs::default"
include_recipe "nodejs::nodejs_from_binary"
include_recipe "nodejs::npm"

install_method = node["nodejs"]["install_method"]
version = node["nodejs"]["version"]

%w(bower webpack).each do |package|
  nodejs_npm package
  link "/usr/local/bin/#{package}" do
    to "/usr/local/nodejs-#{install_method}-#{version}/bin/#{package}"
  end
end

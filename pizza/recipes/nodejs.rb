install_method = ckattr("nodejs.install_method", node["nodejs"]["install_method"], String)
version = ckattr("nodejs.version", node["nodejs"]["version"], String)

include_recipe "nodejs::default"
include_recipe "nodejs::nodejs_from_binary"
include_recipe "nodejs::npm"

%w(bower webpack).each do |package|
  nodejs_npm package
  link "/usr/local/bin/#{package}" do
    to "/usr/local/nodejs-#{install_method}-#{version}/bin/#{package}"
  end
end

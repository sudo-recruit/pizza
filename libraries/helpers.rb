def ckattr(name, value, type)
  if value.is_a?(type)
    value
  else
    Chef::Application.fatal!("attribute '#{name}' is undefined")
  end
end

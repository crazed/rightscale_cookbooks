begin
  require 'fog'
rescue LoadError
  Chef::Log.warn("Missing gem 'fog'")
end


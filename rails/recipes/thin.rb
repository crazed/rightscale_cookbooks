gem_package "thin" do
  action :install
end

# bug with rails 2.3.8 + thin/rack
gem_package "rack" do
  action :remove
  version "1.2.1"
end

template "/etc/thin/default.yml" do
  owner "root"
  group "root"
  mode "644"
  source "yml.erb"
  variables(
    :app_path => node.rails.app_path,
    :thin_servers => node.rails.thin_servers
  )
end

service "thin" do
  action [ :start, :enable ]
end

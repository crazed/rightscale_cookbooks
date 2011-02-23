#
# Cookbook Name:: varnish
# Recipe:: default
#
# Copyright 2011, Datapipe
#
# All rights reserved - Do Not Redistribute
#

raise "Your platform is not supported: #{node.platform}" unless node.platform == 'ubuntu'
package "varnish"

service "varnish" do
  running true
end

template "/etc/default/varnish" do
  source "varnish.erb"
  variables(
    :listen_port => node.varnish.port
  )
  owner "root"
  group "root"
  mode "644"
  notifies :restart, resources(:service => "varnish"), :immediately
end

template "/etc/varnish/default.vcl" do
  source "default.vcl.erb"
  variables(
    :backend_host => node.varnish.backend_host
    :backend_port => node.varnish.backend_port
  )
  owner "root"
  group "root"
  mode "644"
  notifies :restart, resources(:service => "varnish"), :immediately
end

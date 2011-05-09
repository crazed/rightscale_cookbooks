#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2011, Datapipe
#
# All rights reserved - Do Not Redistribute
#

package "redis-server"

service "redis" do
  running true
end

template "/etc/redis/redis.conf" do
  source "redis.conf.erb"
  owner "root"
  group "root"
  mode "644"
  variables(
    :bind_addr => node.redis.bind_address,
    :port => node.redis.listen_port,
    :loglevel => node.redis.loglevel,
    :num_databases => node.redis.databases
  )
  notifies :restart, resources(:service => 'redis'), :immediately
end

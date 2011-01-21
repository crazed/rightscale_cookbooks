#
# Cookbook Name:: memcache
# Recipe:: default
#
# Copyright 2010, Datapipe
#
# All rights reserved - Do Not Redistribute
#
package 'memcached'

service 'memcached' do
  running true
end

template '/etc/memcached.conf' do
  owner 'root'
  group 'root'
  mode '644'
  source 'memcache.conf.erb'
  variables(
    :listen => node.memcache.bind_address,
    :memory_size => node.memcache.memory_size,
    :port => node.memcache.port
  )
  notifies :restart, resources(:service => 'memcached'), :immediately
end

#
# Cookbook Name:: memcache
# Recipe:: default
#
# Copyright 2010, Datapipe
#
# All rights reserved - Do Not Redistribute
#
package "memcached"

service "memcached" do
  action [ :enable, :start ]
end

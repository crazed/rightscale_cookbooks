#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2011, Datapipe
#
# All rights reserved - Do Not Redistribute
#

template '/etc/apt/sources.list.d/10gen.list' do
  source '10gen.list.erb'
  owner 'root'
  group 'root'
  mode '644'
end

execute 'apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10'
execute 'apt-get update'
package 'mongodb-10gen'

service 'mongodb' do
  running true
  action :enable
end

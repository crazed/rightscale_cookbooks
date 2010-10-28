#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2010, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql-server"

service "mysql" do
  action :start
end

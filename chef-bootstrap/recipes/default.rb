#
# Cookbook Name:: chef-bootstrap
# Recipe:: default
#
# Copyright 2010, Datapipe
#
# All rights reserved - Do Not Redistribute
#

execute "gem update --system"
gem_package "chef"

directory "/etc/chef" do
  owner "root"
  group "root"
  mode "755"
end

execute "create validation.pem" do
  command "echo '#{node[:validation_pem]}' > /etc/chef/validation.pem"
end

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

execute "chef-client" do
  command "chef-client -S #{node.chef_server} -j /tmp/base.json"
  action :nothing
end

template "/tmp/base.json" do
  source "base.erb"
  variables(:run_list => node.boot_run_list)
  notifies :run, resources(:execute => "chef-client")
end

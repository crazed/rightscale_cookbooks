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

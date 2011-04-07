#
# Cookbook Name:: solr
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node.platform
when 'ubuntu'
  %w(solr-common solr-tomcat).each do |pkg|
    package pkg
  end
else
  Chef::Log.fatal("Your platform is not supported: #{node.platform}")
  raise
end

service 'tomcat6' do
  running true
  action [ :enabled, :start ]
end

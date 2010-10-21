#
# Cookbook Name:: s3cmd
# Recipe:: default
#
# Copyright 2010, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "s3cmd"

template ".s3cfg" do
  source "s3cfg.erb"
  variables(
    :aws_secret_access_key_id => node.aws_secret_key,
    :aws_access_key_id => node.aws_access_key)
  owner "root"
  group "root"
  mode 600
end

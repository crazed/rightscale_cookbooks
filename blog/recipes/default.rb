#
# Cookbook Name:: blog
# Recipe:: default
#
# Copyright 2010, Datapipe
#
# All rights reserved - Do Not Redistribute
#

execute "remove grants.sql" do
  command "rm -f /tmp/grants.sql"
  action :nothing
end

execute "mysql grants" do
  command "mysql -u root < /tmp/grants.sql"
  action :nothing
end

template "/tmp/grants.sql" do
  source "grants.erb"
  variables(:user => node.blog.mysql_user, :pass => node.blog.mysql_pass, :database => node.blog.database)
  notifies :run, resources(:execute => "mysql grants") 
end

case node.blog_type
when 'drupal'
  url = ''
when 'wordpress'
  blog_wordpress "/srv/http" do
    action :install
  end
end



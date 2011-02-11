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
  notifies :run, resources(:execute => "mysql grants"), :immediately
end

case node.blog.engine
when 'drupal'
  blog_drupal node.www.document_root do
    dbname node.blog.database
    dbuser node.blog.mysql_user
    dbpass node.blog.mysql_pass
    action :install
  end
when 'wordpress'
  blog_wordpress node.www.document_root do
    dbname node.blog.database
    dbuser node.blog.mysql_user
    dbpass node.blog.mysql_pass
    action :install
  end
end

service "nginx" do
  action :stop
end

# add some basic clean url rewrites
template "/etc/nginx/sites-available/default" do
  source "nginx-default.erb"
  variables(
    :document_root => node.www.document_root,
    :server_name => node.domain_name
  )
  notifies :start, resources(:service => "nginx"), :immediately
end

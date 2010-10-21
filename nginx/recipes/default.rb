#
# Cookbook Name:: nginx-web-stack
# Recipe:: default
#
# Copyright 2010, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


doc_root = '/srv/http'
# start off with nginx
package "nginx" do
	action :install
end

# setup the document root
directory doc_root do
	owner "www-data"
	group "www-data"
	mode "0755"
	recursive true
	action :create
end

# drop a default index page in
execute "default-index-page" do
        command "echo '<?php phpinfo(); ?>' > #{doc_root}/index.php"
        action :run
end

# default nginx configuration
template "/etc/nginx/sites-available/default" do
	source "nginx-default.erb"
	variables ({
		:document_root => doc_root,
		:server_name => node.domain_name
	})
end

# start up nginx
service "nginx" do
	supports :status => true, :restart => true
	action [ :enable, :start ]
end

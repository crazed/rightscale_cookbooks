#
# Cookbook Name:: apache2
# Recipe:: default
#
# Copyright 2011, Datapipe
#
# All rights reserved - Do Not Redistribute
#

package "apache2"

log_rules = Array.new
case node.apache2.xforwardedfor_logs
when 'true'
  log_rules << '"%v:%p %{X-Forwarded-For}i %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" vhost_combined'
  log_rules << '"%{X-Forwarded-For}i %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined'
  log_rules << '"%{X-Forwarded-For}i %l %u %t \"%r\" %>s %O" common'
  log_rules << '"%{Referer}i -> %U" referer'
  log_rules << '"%{User-agent}i" agent'
else
  log_rules << '"%v:%p %h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" vhost_combined'
  log_rules << '"%h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined'
  log_rules << '"%h %l %u %t \"%r\" %>s %O" common'
  log_rules << '"%{Referer}i -> %U" referer'
  log_rules << '"%{User-agent}i" agent'
end

service "apache2" do
  running true
end

directory node.www.document_root do
  owner "root"
  group "root"
  mode "755"
  recursive true
end

template "/etc/apache2/apache2.conf" do
  owner "root"
  group "root"
  mode "644"
  source "httpd.conf.erb"
  variables(
    :log_rules => log_rules,
    :max_clients => node.apache2.max_clients,
    :keep_alive => node.apache2.keep_alives
  )
  notifies :restart, resources(:service => "apache2"), :immediately
end

template "/etc/apache2/sites-available/default" do
  owner "root"
  group "root"
  mode "644"
  source "000-default.erb"
  variables(
    :document_root => node.www.document_root
  )
  notifies :restart, resources(:service => "apache2"), :immediately
end

case node.platform
when 'ubuntu'
  if node.apache2.mod_rewrite == 'true'
    execute "enable mod_rewrite" do
      creates "/etc/apache2/mods-enabled/rewrite"
      command "a2enmod rewrite"
      action :run 
      notifies :restart, resources(:service => "apache2"), :immediately
    end
  end
else
  Chef::Log.fatal("Your platform is not supported: #{node.platform}")
  raise
end

# setup some logrotation
remote_file '/etc/logrotate.d/apache2' do
  backup false
  source 'logrotate'
  mode '644'
  owner 'root'
  group 'root'
end

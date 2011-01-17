#
# Cookbook Name:: git-daemon
# Recipe:: default
#
# Copyright 2011, Datapipe
#
# All rights reserved - Do Not Redistribute
#
package 'apache2'
package 'git'
package 'git-daemon-run'
package 'gitweb'

directory node.git.export_path do
  owner 'gitdaemon'
  action :create
end

template '/etc/sv/git-daemon/run' do
  owner 'root'
  mode '755'
  source 'git-daemon-run.erb'
  variables(:git_dir => node.git.export_path)
end

template '/etc/gitweb.conf' do
  owner 'root'
  mode '644'
  source 'gitweb.conf.erb'
  variables(:git_dir => node.git.export_path)
end

service 'git-daemon' do
  start_command "sv start git-daemon"
  stop_command "sv stop git-daemon"
  status_command "sv status git-daemon"
  restart_command "sv restart git-daemon; true" # will return 1, though it restarts fine
  action :restart
end

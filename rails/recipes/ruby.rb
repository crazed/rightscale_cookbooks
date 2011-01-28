#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2010, Datapipe
#
# All rights reserved - Do Not Redistribute
#

case node.platform
when 'ubuntu'
  package 'ruby'
  package 'ruby-dev'
  package 'libopenssl-ruby'
  package 'build-essential'
else 
  Chef::Log.fatal("Your platform is not supported: #{node.platform}")
  raise
end

bash "install rubygems" do
  cwd '/tmp'
  creates '/usr/bin/gem'
  code <<-EOH
  wget http://rubyforge.org/frs/download.php/69365/rubygems-1.3.6.tgz
  tar xzf rubygems-1.3.6.tgz
  cd rubygems-1.3.6
  ruby setup.rb
  gem update --system
  EOH
end

# the rightscale gem sources seem to miss some updates
# and also have broken gem specs at times, add the default ones
# to avoid problems
execute "gem sources -a http://gems.rubyforge.org"

gem_package "rails" do
  version "2.3.8"
end

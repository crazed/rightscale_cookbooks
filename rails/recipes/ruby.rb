#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2010, Datapipe
#
# All rights reserved - Do Not Redistribute
#

package "ruby"
package "ruby-dev"
package "libopenssl-ruby"
package "build-essential"

execute "gem update --system" do
  only_if "which gem"
end

gem_package "rails" do
  version "2.3.8"
end

gem_package "rspec-rails"
gem_package "yard"

# this isn't too robust.. but shouldn't run if using RightScale's images
bash "install gems" do
  not_if "which gem"
  cwd "/tmp"
  code <<-EOH
  wget http://production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz
  tar xzf rubygems-1.3.7.tgz
  cd rubygems-1.3.7
  ruby setup.rb
  EOH
end

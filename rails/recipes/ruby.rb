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
package 'rubygems'

# the rightscale gem sources seem to miss some updates
# and also have broken gem specs at times, add the default ones
# to avoid problems
execute "gem sources -a http://gems.rubyforge.org"

gem_package "rails" do
  version "2.3.8"
end

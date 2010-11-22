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

execute "gem update --system"

# rightscale's mirrors are missing some updated gems
execute "gem sources -a http://gems.rubyforge.org"

gem_package "rails" do
  version "2.3.8"
end

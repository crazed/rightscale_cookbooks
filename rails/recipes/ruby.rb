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

gem_package "rails" do
  version "2.3.8"
end

gem_package "rspec-rails"
gem_package "yard"

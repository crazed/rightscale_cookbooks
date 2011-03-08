#
# Cookbook Name:: devops
# Recipe:: cruisecontrol.rb
#

package "openssl-ruby"
package "rubygems"

gem_package "rake"

user "builder"

directory "/srv" do
  owner 'builder'
  group 'builder'
end

git "/srv/cruisecontrol" do
  user "builder"
  repository "git://github.com/thoughtworks/cruisecontrol.rb.git"
  action :sync
end

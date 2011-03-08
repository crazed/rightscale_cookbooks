#
# Cookbook Name:: devops
# Recipe:: cruisecontrol.rb
#

package "openssl-ruby"
package "rubygems"
git "/srv/cruisecontrol" do
  repository "git://github.com/thoughtworks/cruisecontrol.rb.git"
  action :sync
end

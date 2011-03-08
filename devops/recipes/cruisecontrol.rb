#
# Cookbook Name:: devops
# Recipe:: cruisecontrol.rb
#

package "rubygems"
git "/srv/cruisecontrol" do
  repository "git://github.com/thoughtworks/cruisecontrol.rb.git"
  action :sync
end

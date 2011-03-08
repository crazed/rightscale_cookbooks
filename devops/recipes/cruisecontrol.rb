#
# Cookbook Name:: devops
# Recipe:: cruisecontrol.rb
#

git "/srv/cruisecontrol" do
  repository "git://github.com/thoughtworks/cruisecontrol.rb.git"
  action :sync
end

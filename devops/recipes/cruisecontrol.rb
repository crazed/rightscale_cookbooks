#
# Cookbook Name:: devops
# Recipe:: cruisecontrol.rb
#

package "openssl-ruby"
package "rubygems"
gem_package "rake"
git "/srv/cruisecontrol" do
  repository "git://github.com/thoughtworks/cruisecontrol.rb.git"
  action :sync
end

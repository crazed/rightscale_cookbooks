#
# Cookbook Name:: blog
# Recipe:: default
#
# Copyright 2010, Datapipe
#
# All rights reserved - Do Not Redistribute
#

case node.blog_type
when 'drupal'
  url = ''
when 'wordpress'
  blog_wordpress "/srv/http" do
    action :install
  end
end



package "nginx"
service "nginx" do
  action :stop
end
template "/etc/nginx/conf.d/thin.conf" do
  source "thin.conf.erb"
  variables(:thin_sockets => node.rails.thin_servers)
  owner "root"
  group "root"
  mode "644"
end
template "/etc/nginx/sites-available/default" do
  source "nginx-default.erb"
  variables(:app_path => node.rails.app_path)
  notifies :start, resources(:service => "nginx")
end

package "nginx"
service "nginx" do
  action :start
end

sockets = Array.new
for i in 0..Integer(node.rails.thin_servers)-1
  sockets << "/tmp/thin.#{i}.sock"
end

template "/etc/nginx/conf.d/thin.conf" do
  owner "root"
  group "root"
  mode "644"
  source "thin.conf.erb"
  variables(:sockets => sockets)
  notifies :restart, resources(:service => "nginx")
end

template "/etc/nginx/sites-available/default" do
  owner "root"
  group "root"
  mode "644"
  source "nginx-default.erb"
  variables(:app_path => node.rails.app_path)
  notifies :restart, resources(:service => "nginx")
end

package "nginx"
service "nginx" do
  action :stop
end

sockets = Array.new
for i in 0..Integer(node.rails.thin_servers)
  sockets << "/tmp/thin.#{i}.sock"
end

template "/etc/nginx/conf.d/thin.conf" do
  source "thin.conf.erb"
  variables(:sockets => sockets)
  owner "root"
  group "root"
  mode "644"
end

template "/etc/nginx/sites-available/default" do
  source "nginx-default.erb"
  variables(:app_path => node.rails.app_path)
  notifies :start, resources(:service => "nginx")
end

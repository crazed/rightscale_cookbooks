package "nginx"

service "nginx" do
  action [:start, :enable]
end

template "/etc/nginx/conf.d/unicorn.conf" do
  owner "root"
  group "root"
  mode "644"
  source "unicorn.conf.erb"
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

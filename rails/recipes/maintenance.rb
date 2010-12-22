execute "control maintenance page" do
  maintenance_path = "#{node.rails.app_path}/current/public/system/maintenance.html"
  if File.exists(maintenance_path)
    Chef::Log.info "Maintenance page is currently active, disabling it."
    command "rm -f #{maintenance_path}"
  else
    Chef::Log.info "Maintenance page is not active, enabling it."
    command "ln -s #{node.rails.app_path}/current/public/system/#{node.rails.maintenance_page} #{maintenance_path}"
  end
end

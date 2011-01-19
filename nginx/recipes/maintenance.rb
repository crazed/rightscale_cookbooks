case node.platform
when 'ubuntu'
  www_user = 'www-data'
  www_group = 'www-data'
else
  Chef::Log.fatal("Your platform is not supported: #{node.platform}")
  raise
end

case File.exists?("#{node.nginx.document_root}/maintenance.html")
when true
  execute "rm -f #{node.nginx.document_root}/maintenance.html"
else
  template "#{node.nginx.document_root}/maintenance.html" do
    backup false
    owner www_user
    group www_group
    mode '644'
    source 'maintenance.html.erb'
    variables(:html => node.nginx.maintenance_html)
  end
end

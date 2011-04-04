action :install do
  package "unzip"
  remote_file "/tmp/wordpress.zip" do
    source "http://wordpress.org/latest.zip"
  end
  bash "install_wordpress" do
    cwd "/tmp"
    code <<-EOH
    wget http://wordpress.org/latest.zip
    unzip latest.zip
    rm -rf #{new_resource.install_path}
    mv /tmp/wordpress #{new_resource.install_path}
    chown -R www-data:www-data #{new_resource.install_path}
    EOH
  end
  directory new_resource.install_path do
    owner "www-data"
    group "www-data"
    mode "755"
  end
  execute "preconfigure" do
    command "curl http://localhost/wp-admin/setup-config.php?step=1 -d dbname=#{new_resource.dbname} -d uname=#{new_resource.dbuser} -d pwd=#{new_resource.dbpass} -d dbhost=#{new_resource.dbhost} -d prefix=wp_"
  end
end

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
    EOH
  end
end

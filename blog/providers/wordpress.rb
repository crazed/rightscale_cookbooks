action :install do
  package "unzip"
  remote_file "/tmp/wordpress.zip" do
    source "http://wordpress.org/latest.zip"
  end
  execute "extraction" do
    command "unzip /tmp/wordpress.zip -d #{new_resource.install_path}"
  end
end

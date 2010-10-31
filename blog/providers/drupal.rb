action :install do
  # start off by grabbing the latest drush and drush_make
  directory "/opt/datapipe/drush" do
    recursive true
    owner "root"
    group "root"
    mode "755"
  end

  git "/opt/datapipe/drush" do
    repository "git://git.drupalcode.org/project/drush.git"
  end

  git "/opt/datapipe/drush/commands/drush_make" do
    repository "git://git.drupalcode.org/project/drush_make.git"
    revision "6.x-2.x" # note: HEAD/master were empty last I checked
  end
  
  # setup the drush make file
  remote_file "/tmp/drupal.make" do
    source "drupal.make" 
  end

  # run drush installer
  bash "drush install" do
    user "root"
    cwd "/tmp"
    code <<-EOH
    rm -rf #{node.code_path}
    /opt/datapipe/drush/drush make --prepare-install drupal.make #{node.code_path}
    rm -f /tmp/drupal.make
    EOH
  end

end

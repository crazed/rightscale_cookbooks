package "git-core"
directory "#{node.rails.app_path}/shared/system" do
  recursive true
  owner "root"
  group "root"
  mode "755"
end
directory "#{node.rails.app_path}/shared/log"do
  recursive true
  owner "root"
  group "root"
  mode "755"
end
directory "#{node.rails.app_path}/shared/tmp"do
  recursive true
  owner "root"
  group "root"
  mode "755"
end
deploy node.rails.app_path do
  repo node.rails.repo
  migrate true
  @symlink_before_migrate = {}
  migration_command "rake db:migrate"
  shallow_clone true
  environment "HOME" => "/tmp", "RAILS_ENV" => "production"
  restart_command "thin restart --all /etc/thin"
  action :deploy
end


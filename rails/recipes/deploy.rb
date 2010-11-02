package "git-core"
directory "#{node.rails.app_path}/system" do
  owner "root"
  group "root"
  mode "755"
end
directory "#{node.rails.app_path}/log"do
  owner "root"
  group "root"
  mode "755"
end
deploy node.rails.app_path do
  repo node.rails.repo
  migrate true
  migration_command "rake db:migrate"
  shallow_clone true
  environment "HOME" => "/tmp", "RAILS_ENV" => "production"
  symlinks "system" => "public/system", "log" => "log"
  restart_command "thin restart --all /etc/thin"
  action :deploy
end


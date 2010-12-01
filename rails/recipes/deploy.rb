package "git-core"
['system', 'log', 'tmp', 'pids'].each do |dir|
  directory "#{node.rails.app_path}/shared/#{dir}" do
    recursive true
    owner "root"
    group "root"
    mode "755"
  end
end

deploy node.rails.app_path do
  repo node.rails.repo
  migrate true
  @symlink_before_migrate = {}
  migration_command "rake gems:install db:migrate"
  shallow_clone true
  environment "HOME" => "/tmp", "RAILS_ENV" => node.rails.environment
  if File.exists? "/var/run/unicorn/unicorn.pid"
    restart_command "kill -USR2 `cat /var/run/unicorn.pid`"
  else
    restart_command ""
  end
  action :deploy
end


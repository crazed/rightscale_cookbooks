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
  purge_before_symlink %w{log tmp/pids}
  symlinks "pids" => "tmp/pids", "log" => "log"
  migration_command "rake gems:install db:migrate"
  shallow_clone true
  environment "HOME" => "/tmp", "RAILS_ENV" => node.rails.environment
  branch node.rails.branch
  if File.exists? "/var/run/unicorn/unicorn.pid"
    restart_command "kill -USR2 `cat /var/run/unicorn/unicorn.pid`"
  else
    restart_command ""
  end
  action :deploy
end


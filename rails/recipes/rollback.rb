deploy node.rails.app_path do
  repo node.rails.repo
  migrate false
  @symlink_before_migrate = {}
  migration_command "rake gems:install db:migrate"
  shallow_clone true
  environment "HOME" => "/tmp", "RAILS_ENV" => node.rails.environment
  restart_command "thin restart --all /etc/thin"
  action :rollback
end


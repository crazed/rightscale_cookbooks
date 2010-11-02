package "git-core"
deploy node.rails.app_path do
  repo node.rails.repo
  migrate true
  migration_command "rake db:migrate"
  shallow_clone true
  environment "HOME" => "/tmp", "RAILS_ENV" => "production"
  action :deploy
end


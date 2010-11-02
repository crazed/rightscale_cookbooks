package "git-core"
service "thin" do
  action :stop
end
deploy node.rails.app_path do
  repo node.rails.repo
  migrate true
  migration_command "rake db:migrate"
  shallow_clone true
  action :deploy
  notifies :start, resources(:service => "thin")
end


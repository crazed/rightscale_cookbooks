execute "rake command" do
  cwd "#{node.rails.app_path}/current"
  command "rake #{node.rails.rake_tasks} RAILS_ENV=#{node.rails.environment}"
end

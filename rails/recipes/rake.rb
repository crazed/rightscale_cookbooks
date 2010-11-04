node.rails.rake_tasks.split(' ').each do |task|
  execute "rake #{task}" do
    cwd "#{node.rails.app_path}/current"
    Chef::Log.info("Executing task: rake RAILS_ENV=#{node.rails.environment} #{task}")
    command "rake RAILS_ENV=#{node.rails.environment} #{task}"
  end
end

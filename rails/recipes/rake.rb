execute "rake command" do
  cwd node.rails.app_path
  command "rake #{node.rails.rake_tasks}"
end

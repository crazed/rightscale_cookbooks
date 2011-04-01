include_recipe "rds::new_database"
wordpress_single_site node.www.document_root do
  dbname node.rds.new_database
  dbuser node.rds.new_user
  dbpass node.rds.new_password
  action :install
end

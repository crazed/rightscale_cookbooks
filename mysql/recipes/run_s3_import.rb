include_recipe "mysql::default"
include_recipe "s3cmd::default"

s3cmd_get "/tmp/import.sql" do
  bucket node.mysql.s3_dump_bucket
  s3_file_path node.mysql.s3_dump_file
  action :run
end

mysql_import "/tmp/import.sql"

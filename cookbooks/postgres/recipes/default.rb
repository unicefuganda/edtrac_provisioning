execute "installing updates" do
  command "sudo apt-get update"
  action :run
end

package "postgresql-9.1" do
  action :install  
end

template "/etc/postgresql/9.1/main/pg_hba.conf" do
  source "pg_hba.conf.erb"
end

template "/etc/postgresql/9.1/main/postgresql.conf" do
  source "postgresql.conf.erb"
end

service "postgresql" do
  action :restart
end 

execute "Create empty database" do
	command "createdb edtrac"
	user "postgres"
	not_if "psql --list | grep edtrac", :user => 'postgres'
	action :run
end 

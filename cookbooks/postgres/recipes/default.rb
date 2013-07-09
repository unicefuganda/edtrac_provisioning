execute "installing updates" do
  command "sudo apt-get update"
  action :run
end

package "postgresql" do
  action :install
end

template "/etc/postgresql/9.1/main/pg_hba.conf" do
  user "postgres"
  source "pg_hba.conf.erb"
end

template "/etc/postgresql/9.1/main/postgresql.conf" do
  user "postgres"
  source "postgresql.conf.erb"
end

execute "restarting postgresql as root" do
  user "root"
  command "service postgresql restart"
  action :run
end

execute "Create empty database" do
  command "createdb edtrac"
  user "postgres"
  not_if "psql --list | grep edtrac", :user => 'postgres'
  action :run
end 

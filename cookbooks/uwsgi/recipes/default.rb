package "libxml2-dev" do
	action :install
end

package "uwsgi" do
  action :install
end

package "uwsgi-plugin-python" do
  action :install
end

template "/etc/uwsgi/apps-enabled/edtrac.ini" do
  source "edtrac.ini.erb"
end

template "/etc/uwsgi/apps-available/edtrac.ini" do
  source "edtrac.ini.erb"
end

execute "Clean up data Socket dir if it exists" do
  command "rm -rf /var/www/sockets"
  action :run
end

execute "Make data dir" do
  command "mkdir /var/www/ && mkdir /var/www/sockets"
  action :run
end
service "uwsgi" do
	action :start
end



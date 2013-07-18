execute "activating virtualenv and installing dependencies" do
  cwd "/vagrant"
  command "bash -c 'source /home/vagrant/edtrac_env/bin/activate && pip install -r requirements.pip'"
  action :run
end

template "/vagrant/edtrac_project/localsettings.py" do
  source "localsettings.py.erb"
end

execute "running migrations" do
  cwd "/vagrant/edtrac_project"
  command "bash -c 'source /home/vagrant/edtrac_env/bin/activate && python manage.py syncdb --noinput && python manage.py migrate'"
  action :run
end

execute "setup the initial data in the database" do
  cwd "/vagrant/edtrac_project"
  command "bash -c 'source /home/vagrant/edtrac_env/bin/activate && python manage.py initialize_database'"
  action :run
end

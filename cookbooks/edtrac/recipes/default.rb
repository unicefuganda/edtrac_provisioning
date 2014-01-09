
ENV['DJANGO_SETTINGS_MODULE'] = node["edtrac"]["settings"]

execute "activating virtualenv and installing dependencies" do
  cwd "/vagrant"
  command "bash -c 'source /home/vagrant/edtrac_env/bin/activate && pip install -r requirements.pip'"
  action :run
end

directory "/var/log/edtrac" do
  mode "0644"
  action :create
end

file "/var/log/edtrac/edtrac.log" do
  mode "0644"
  action :create
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

#
# Cookbook Name:: edtrac
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
 
git "/home/vagrant/edtrac" do
    repository "https://github.com/unicefuganda/edtrac.git"
    reference "master"
    action :checkout
end

execute "initialize submodules" do
  cwd "/home/vagrant/edtrac"
  command "git submodule init"
  action :run
end

execute "update all the submodules" do
  cwd "/home/vagrant/edtrac"
  command "git submodule update"
  action :run
end

execute "activating virtualenv and installing dependencies" do
  cwd "/home/vagrant/edtrac"
  command "bash -c 'source /home/vagrant/edtrac_env/bin/activate && pip install -r requirements.pip'"
  action :run
end

template "/home/vagrant/edtrac/edtrac_project/localsettings.py" do
  source "localsettings.py.erb"
end

execute "running migrations" do
  cwd "/home/vagrant/edtrac/edtrac_project"
  command "bash -c 'source /home/vagrant/edtrac_env/bin/activate && python manage.py syncdb --noinput && python manage.py migrate'"
  action :run
end

execute "setup the initial data in the database" do
  cwd "/home/vagrant/edtrac/edtrac_project"
  command "bash -c 'source /home/vagrant/edtrac_env/bin/activate && python manage.py initialize_database'"
  action :run
end

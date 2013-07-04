#
# Cookbook Name:: edtrac
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

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

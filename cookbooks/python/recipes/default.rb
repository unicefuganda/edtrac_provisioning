#
# Cookbook Name:: python
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "installing updates" do
  command "sudo apt-get update"
  action :run
end

package "python-software-properties" do 
  action :install
end

execute "adding the ppa for python2.6" do
  command "sudo add-apt-repository ppa:fkrull/deadsnakes"
  action :run
end

execute "installing updates" do
  command "sudo apt-get update"
  action :run
end

%w{build-essential python-setuptools python2.6 python2.6-dev python-pip libpq-dev libxml2 libxml2-dev libxslt1-dev}.each do |pkg|
  package pkg do
    action :install
  end
end
  
execute "installing virtualenv" do
  command "pip install virtualenv"
  action :run
end

execute "creating edtrac virtualenv" do
  cwd "/home/vagrant"
  command "virtualenv edtrac_env --python=python2.6"
  action :run
end

execute "owning the virtualenv" do
  command "sudo chown vagrant:vagrant /home/vagrant/edtrac_env/ -R"
  action :run
end


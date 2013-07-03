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


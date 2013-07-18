execute "installing updates" do
  command "sudo apt-get update"
  action :run
end

%w{build-essential python-setuptools python-dev python-pip libpq-dev libxml2 libxml2-dev libxslt1-dev}.each do |pkg|
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
  command "virtualenv edtrac_env"
  action :run
end

execute "owning the virtualenv" do
  command "sudo chown vagrant:vagrant /home/vagrant/edtrac_env/ -R"
  action :run
end


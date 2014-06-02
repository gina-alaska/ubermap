include_recipe 'yum-epel'
include_recipe 'yum-gina'

node['ubermap']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end
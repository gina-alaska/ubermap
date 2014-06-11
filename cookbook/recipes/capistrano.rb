app_name = "ubermap"
account = node[app_name]['account']

%w{ application_path shared_path config_path initializers_path deploy_path }.each do |dir|
  directory node[app_name][dir] do
    owner account
    group account
    mode 00755
    action :create
    recursive true
  end
end


template "#{node[app_name]['shared_path']}/config/database.yml" do
  owner account
  group account
  mode 00644
  variables({
    environment: node[app_name]['environment'],
    database: node[app_name]['database']
  })
end

template "#{node[app_name]['shared_path']}/config/secrets.yml" do
  owner account
  group account
  mode 00644
  variables({
    secrets: node[app_name]['secrets']
  })
end  

directory "/home/#{account}/.bundle" do
  owner account
  group account
  mode 00755
  action :create
end

template "/home/#{account}/.bundle/config" do
  source "bundle/config.erb"
  owner account
  group account
  mode 00644
end

%w{log tmp public system tmp/pids tmp/sockets}.each do |dir|
  directory "#{node[app_name]['shared_path']}/#{dir}" do
    owner node[app_name]['account']
    group node[app_name]['account']
    mode 0755
  end
end

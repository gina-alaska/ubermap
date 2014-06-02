app_name = "ubermap"

unicorn_config "#{node[app_name]['unicorn_config_path']}/#{app_name}.rb" do
  preload_app true
  listen("#{node[app_name]['shared_path']}/tmp/sockets/unicorn.socket" => {backlog: 1024})
  pid("#{node[app_name]['shared_path']}/tmp/pids/unicorn.pid")
  stderr_path("#{node[app_name]['shared_path']}/log/unicorn.stderr.log")
  stdout_path("#{node[app_name]['shared_path']}/log/unicorn.stdout.log")
  worker_timeout 60
  worker_processes [node['cpu']['total'].to_i * 4, 8].min
  working_directory "#{node[app_name]['deploy_path']}"
  before_fork node[app_name]['before_fork']
  after_fork node[app_name]['after_fork']
end

template "/etc/init.d/unicorn_#{app_name}" do
  source "unicorn_init.erb"
  action :create
  mode 00755
  variables({
    install_path: node[app_name]['deploy_path'],
    unicorn_config_file: "#{node[app_name]['unicorn_config_path']}/#{app_name}.rb",
    user: node[app_name]['account'],
    environment: node[app_name]['environment']
  })
end

service "unicorn_#{app_name}" do 
  action :enable
end
app_name = "ubermap"

template "/etc/init.d/sidekiq_#{app_name}" do
  source "sidekiq_init.erb"
  action :create
  mode 00755
  variables({
    install_path: node[app_name]['deploy_path'],
  })
end

service "sidekiq_#{app_name}" do 
  action :enable
end
app_name = "ubermap"
node.default!['nginx']['default_site_enabled'] = false

include_recipe 'nginx'

ruby_block 'move_nginx_confs' do
  block do
    if File.exists? '/etc/nginx/conf.d'
      FileUtils::rm_rf '/etc/nginx/conf.d'
    end
  end
end

proxies = if Chef::Config[:solo]
  []
else
  search(:node, 'role:haproxy').collect{|n| n['ipaddress'] }
end

template "/etc/nginx/sites-available/#{app_name}_site" do
  source 'nginx_site.erb'
  variables({
    install_path: node[app_name]['deploy_path'],
    shared_path: node[app_name]['shared_path'],
    name: app_name,
    user: node[app_name]['account'],
    proxies: proxies
  })
end

nginx_site "#{app_name}_site"
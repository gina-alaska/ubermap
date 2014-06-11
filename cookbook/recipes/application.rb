include_recipe "ubermap::packages"
include_recipe "ubermap::ruby"

include_recipe "ubermap::_database_common"
include_recipe "postgresql::client"
include_recipe "ubermap::capistrano"

directory "/www"

app_name = "ubermap"
account = node[app_name]['account']

link "/home/#{account}/#{app_name}" do
  to node[app_name]['deploy_path']
  owner node[app_name]['account']
  group node[app_name]['account']
end
# 
# template "/etc/profile.d/mapping_tools.sh" do
#   source "mapping_tools.sh.erb"
#   mode 0755
#   variables({
#     version: "2014.03.12"
#   })
# end

appname = 'ubermap'

include_recipe 'ubermap::_database_common'
include_recipe 'yum-epel'

node.default['postgresql']['pg_hba'] = [{
	:type => 'host', 
	:db => node[appname]['database']['database'], 
	:user => node[appname]['database']['username'], 
	:addr => 'all', 
	:method => 'trust'
},{
  :type => 'host', 
  :db => 'postgres', 
  :user => node[appname]['database']['username'], 
  :addr => 'all', 
  :method => 'trust'
}] + node.default['postgresql']['pg_hba']

include_recipe 'postgresql::server'
include_recipe 'database::default'
include_recipe 'postgresql::ruby'

postgresql_connection_info = {
	host: '127.0.0.1',
	port: 5432,
	username: 'postgres',
	password: node['postgresql']['password']['postgres']
}

# create a postgresql database
postgresql_database node[appname]['database']['database'] do
  connection postgresql_connection_info
  action :create
end

# Create a postgresql user but grant no privileges
postgresql_database_user node[appname]['database']['username'] do
  connection postgresql_connection_info
  password   node[appname]['database']['password']
  action     :create
end

# Grant all privileges on all tables in foo db
postgresql_database_user node[appname]['database']['username'] do
  connection    postgresql_connection_info
  database_name  node[appname]['database']['database']
  privileges    [:all]
  action        :grant
end


#Ghetto way of doing it.
#  Lets work on a postgis cookbook at soem point
package 'postgis2_92'
package 'postgis2_92-devel'
package 'postgresql92-contrib'

bash "install-hstore-extension" do
  user 'postgres'
  code <<-EOH
    echo 'CREATE EXTENSION IF NOT EXISTS "hstore";' | psql -d #{node[appname]['database']['database']}
  EOH
  action :run
end


#  Example what the dsl might look like
# postgis_database node[appname]['database'] do
#   action :create
# end
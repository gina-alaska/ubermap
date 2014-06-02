default['ubermap']['packages'] = %w{ }
default['ubermap']['account'] = 'webdev'

default['ubermap']['application_path'] = '/www/ubermap'
default['ubermap']['shared_path'] = "#{default['ubermap']['application_path']}/shared"
default['ubermap']['config_path'] = "#{default['ubermap']['shared_path']}/config"
default['ubermap']['initializers_path'] = "#{default['ubermap']['config_path']}/initializers"
default['ubermap']['unicorn_config_path'] =  '/etc/unicorn'
default['ubermap']['deploy_path'] = "#{default['ubermap']['application_path']}/current"
default['ubermap']['environment'] = 'production'

default['ubermap']['database']['adapter']  = "postgresql"
default['ubermap']['database']['hostname'] = "localhost"
default['ubermap']['database']['database'] = "ubermap_prod"
default['ubermap']['database']['username'] = "ubermap"
default['ubermap']['database']['password'] = ""
default['ubermap']['database']['search_path'] = "ubermap_prod,public"

default['ubermap']['secrets']['secret_key_base'] = nil

default['ubermap']['before_fork'] = ''

default['ubermap']['after_fork'] = "
defined?(ActiveRecord::Base) and
  ActiveRecord::Base.establish_connection
"
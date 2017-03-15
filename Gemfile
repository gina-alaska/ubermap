source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'

# Use sqlite3 as the database for Active Record
gem 'pg'
gem 'mustache'
gem 'dotenv-rails', require: 'dotenv/rails-now'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
gem "refile", require: "refile/rails"
gem "refile-s3"
gem 'nested_form'
gem 'remotipart', '~> 1.2'
gem 'cancancan', '~> 1.10'
gem 'simple_form'
gem 'friendly_id', '~> 5.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
#gem 'unicorn'
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano', group: :development
group :development do
  gem 'capistrano', '~> 3.4'
  gem 'capistrano-chruby'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-bower'
  gem 'web-console', '~> 2.0'
  gem 'guard'
  gem 'guard-minitest'
end

group :production do
  gem 'tzinfo-data'
  gem 'rb-readline'
end

# Use debugger
# gem 'debugger', group: [:development, :test]
gem 'font-awesome-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-intl'
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-jquery-ui', '~> 1.9.2'
  gem 'rails-assets-proj4leaflet'
  gem 'rails-assets-leaflet.markercluster', '0.4.0.hotfix.1'
  gem 'rails-assets-ace-builds'
  gem 'rails-assets-proj4'
  gem 'rails-assets-handlebars'
  gem 'rails-assets-handlebars-helper-intl'
end

gem "haml"
gem "omniauth"
gem "omniauth-github"
gem "omniauth-google-oauth2"
gem "omniauth-openid"
gem "google-api-client"
gem "version"

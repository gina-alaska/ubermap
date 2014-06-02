include_recipe "yum-gina"

package "gina-ruby-19" do
  action :install
end

node.default['chruby']['default'] = "ruby-1.9.3-p448"
include_recipe "chruby"

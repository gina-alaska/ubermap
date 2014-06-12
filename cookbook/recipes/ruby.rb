include_recipe "yum-gina"

package "gina-ruby-19" do
  action :install
end
package "gina-ruby-21" do
  action :install
end

include_recipe "chruby"

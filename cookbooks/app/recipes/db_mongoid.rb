include_recipe "mongodb"

template "/var/www/shared/config/mongoid.yml" do
  source "mongoid.yml.erb"
  owner "www-data"
  group "www-data"
  variables( :username => node[:mongoid][:username],
             :port => node[:mongodb][:port],
             :host => node[:mongoid][:bind_address] )
end
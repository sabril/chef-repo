#
# Cookbook Name:: milli-redis
# Recipe:: default
#
# Copyright 2011, Example Com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "build-essential" do
  action :install
end

user node[:redis][:user] do
  action :create
  system true
  shell "/bin/false"
end

directory node[:redis][:dir] do
  owner "root"
  mode "0755"
  action :create
end

directory node[:redis][:data_dir] do
  owner "redis"
  mode "0755"
  action :create
end

directory node[:redis][:log_dir] do
  mode 0755
  owner node[:redis][:user]
  action :create
end

remote_file "#{Chef::Config[:file_cache_path]}/redis.tar.gz" do
  source "https://github.com/antirez/redis/tarball/v2.0.4-stable"
  action :create_if_missing
end

bash "compile_redis_source" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar zxf redis.tar.gz
    cd antirez-redis-55479a7
    make && make install
  EOH
  creates "/usr/local/bin/redis-server"
end

service "redis" do
  provider Chef::Provider::Service::Upstart
  subscribes :restart, resources(:bash => "compile_redis_source")
  supports :restart => true, :start => true, :stop => true
end

template "redis.conf" do
  path "#{node[:redis][:dir]}/redis.conf"
  source "redis.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "redis")
end

template "redis.upstart.conf" do
  path "/etc/init/redis.conf"
  source "redis.upstart.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "redis")
end

service "redis" do
  action [:enable, :start]
end
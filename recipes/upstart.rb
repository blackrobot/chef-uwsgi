#
# Cookbook Name:: uwsgi
# Recipe:: upstart
#
# Copyright:: Copyright (c) 2013, Damon Jablons
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

template "/etc/init/uwsgi.conf" do
  source "uwsgi.conf.erb"
  mode 0644
  backup false
  owner "root"
  group "root"
  variables({
    :log_path => node['uwsgi']['log_path'],
    :config_path => node['uwsgi']['config_path']
  })
  action :create_if_missing
end

execute "reload-initctl" do
  command "initctl reload-configuration"
  action :run
end

service "uwsgi" do
  supports :start => true, :stop => true, :restart => true
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end

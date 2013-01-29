#
# Cookbook Name:: uwsgi
# Recipe:: default
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

include_recipe "python"

# A dependency of uWSGI
package "libssl0.9.8" do
  action :upgrade
end

# Install the latest version with pip
python_pip "uwsgi" do
  action :install
end

# Add the uwsgi config directory
directory node['uwsgi']['config_path'] do
  owner "root"
  group "root"
  mode 0755
end

# Add an upstart script
include_recipe "uwsgi::upstart"

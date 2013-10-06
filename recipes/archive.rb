include_recipe "build-essential"

remote_file "#{Chef::Config[:file_cache_path]}/re2-#{node['re2']['archive']['version']}.tgz" do
  source    node['re2']['archive']['url']
  checksum  node['re2']['archive']['checksum']
  mode      "0644"
  action    :create_if_missing
end

execute "Extracting re2 #{node['re2']['archive']['version']}" do
  cwd Chef::Config[:file_cache_path]
  command "tar -zxf re2-#{node['re2']['archive']['version']}.tgz"
  creates "#{Chef::Config[:file_cache_path]}/re2"
end

execute "Installing re2 #{node['re2']['archive']['version']} archive" do
  cwd "#{Chef::Config[:file_cache_path]}/re2"
  command "make && make install"
  creates "#{node['re2']['archive']['install_dir']}/lib/libre2.so"
  action :run
  notifies :run, "execute[ldconfig]", :immediately
end

execute "ldconfig" do
  command "ldconfig"
  action :nothing
end

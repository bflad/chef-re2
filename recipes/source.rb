include_recipe "build-essential"
include_recipe "mercurial"

directory "#{Chef::Config[:file_cache_path]}/re2" do
  owner "root"
  group "root"
  mode 00755
  recursive true
  action :create
end

mercurial "#{Chef::Config[:file_cache_path]}/re2" do
  repository node['re2']['source']['url']
  reference node['re2']['source']['reference']
  action :checkout
end

execute "Installing re2 via source" do
  cwd "#{Chef::Config[:file_cache_path]}/re2"
  command "make install"
  creates "/usr/local/lib/libre2.so"
  action :run
  notifies :run, "execute[ldconfig]", :immediately
end

execute "ldconfig" do
  command "ldconfig"
  action :nothing
end

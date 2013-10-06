include_recipe "yum::epel" if node['platform_family'] == "rhel"

node['re2']['package']['packages'].each do |p|
  package p
end

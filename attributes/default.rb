default['re2']['install_type'] =
  case node['platform_family']
  when 'fedora', 'rhel' then 'package'
  else; 'archive'
  end

# Archive attributes
default['re2']['archive']['install_dir'] = '/usr/local'
default['re2']['archive']['version'] = '20130802'
default['re2']['archive']['url'] = "https://re2.googlecode.com/files/re2-#{node['re2']['archive']['version']}.tgz"
default['re2']['archive']['checksum'] =
  case node['re2']['archive']['version']
  when '20130802' then '17f26acb64745e2bc26dbb9c0fb6d32f0f68965d1c1ce2ad3cd50766b55cdd8b'
  end

# Package attributes
default['re2']['package']['packages'] = value_for_platform(
  %w{centos fedora redhat} => {
    'default' => %w{re2 re2-devel}
  }
)

# Source attributes
default['re2']['source']['reference'] = 'tip'
default['re2']['source']['url'] = 'https://re2.googlecode.com/hg'

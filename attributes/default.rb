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
  when '20131024' then '4cbf7a98e79ba0c3f83b865049bcf3c6d60593b1a7accb60e8e10745a97cd62b'
  when '20140110' then '456a128a5582b13dfaf92b725ecafdad9c45e05c31c703d1f9955696551f6b5c'
  when '20140111' then '193c9eedd88e9a32f337e81f3be45da13a85c7af43444f5afe03f8ef393490ef'
  when '20140304' then '0bffd1a57de2f4b218ca0f77d8850bfd59c82944a98256c6edba25260e0196a7'
  end

# Package attributes
default['re2']['package']['packages'] = value_for_platform(
  %w(centos fedora redhat) => {
    'default' => %w(re2 re2-devel)
  }
)

# Source attributes
default['re2']['source']['reference'] = 'tip'
default['re2']['source']['url'] = 'https://re2.googlecode.com/hg'

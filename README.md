# chef-re2 [![Build Status](https://secure.travis-ci.org/bflad/chef-re2.png?branch=master)](http://travis-ci.org/bflad/chef-re2)

## Description

Installs [re2](https://code.google.com/p/re2/). Please see [COMPATIBILITY.md](COMPATIBILITY.md) for more information about re2 versions that are tested and supported by cookbook versions.

## Requirements

### Platforms

* CentOS 6
* Fedora 18, 19, 20
* RHEL 6
* Ubuntu 12.04, 12.10, 13.04, 13.10

### Cookbooks

[Opscode Cookbooks](https://github.com/opscode-cookbooks/)

* [build-essential](https://github.com/opscode-cookbooks/build-essential)

## Attributes

These attributes are under the `node['re2']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
install_type | Installation type for re2 ("archive", "package", or "source") | String | auto-detected (see attributes/default.rb)

### Archive Attributes

These attributes are under the `node['re2']['archive']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
checksum | SHA256 checksum for archive | String | auto-detected (see attributes/default.rb)
install_dir | Installation prefix | String | /usr/local
url | Archive URL | String | `https://re2.googlecode.com/files/re2-#{node['re2']['archive']['version']}.tgz`
version | Archive version to install | String | 20130802

### Package Attributes

These attributes are under the `node['re2']['package']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
packages | Packages for installation | Array of Strings | auto-detected (see attributes/default.rb)

### Source Attributes

These attributes are under the `node['re2']['source']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
reference | Repository reference for re2 source | String | tip
url | Repository URL for re2 source | String | https://re2.googlecode.com/hg

## Recipes

* `recipe[re2]` Installs re2
* `recipe[re2::archive]` Installs re2 via archive
* `recipe[re2::package]` Installs re2 via package
* `recipe[re2::source]` Installs re2 via source

## Usage

### Default Installation

Defaults to installing archive on Ubuntu and installing packages on Fedora/RHEL based systems.

* Add `recipe[re2]` to your node's run list

### Archive Installation

* If necessary, set `node['re2']['archive']['version']` and `node['re2']['archive']['checksum']`
* Add `recipe['gflags::archive']` to your node's run list

### Package Installation

* Add `recipe[re2::package]` to your node's run list

### Source Installation

* Add `recipe[re2::source]` to your node's run list

## Testing and Development

### Vagrant

Here's how you can quickly get testing or developing against the cookbook thanks to [Vagrant](http://vagrantup.com/) and [Berkshelf](http://berkshelf.com/).

    vagrant plugin install vagrant-berkshelf
    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-omnibus
    git clone git://github.com/bflad/chef-gflags.git
    cd chef-gflags
    vagrant up BOX # BOX being centos6, ubuntu1204, ubuntu1210, or ubuntu1304

You can then SSH into the running VM using the `vagrant ssh BOX` command.

The VM can easily be stopped and deleted with the `vagrant destroy` command. Please see the official [Vagrant documentation](http://docs.vagrantup.com/v2/cli/index.html) for a more in depth explanation of available commands.

### Test Kitchen

Please see documentation in: [TESTING.md](TESTING.md)

## Contributing

Please use standard Github issues/pull requests and if possible, in combination with testing on the Vagrant boxes or Test Kitchen suite.

## Maintainers

* Brian Flad (<bflad417@gmail.com>)

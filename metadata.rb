name              "re2"
maintainer        "Brian Flad"
maintainer_email  "bflad417@gmail.com"
license           "Apache 2.0"
description       "Installs re2"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.3.0"
recipe            "re2", "Installs re2"
recipe            "re2::archive", "Installs re2 via archive"
recipe            "re2::package", "Installs re2 via package"
recipe            "re2::source", "Installs re2 via source"

%w{ centos fedora redhat ubuntu }.each do |os|
  supports os
end

%w{ build-essential mercurial yum }.each do |cb|
  depends cb
end

name              "re2"
maintainer        "Brian Flad"
maintainer_email  "bflad417@gmail.com"
license           "Apache 2.0"
description       "Installs re2"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.0"
recipe            "re2", "Installs re2"
recipe            "re2::archive", "Installs re2 via archive"

%w{ centos fedora redhat ubuntu }.each do |os|
  supports os
end

%w{ build-essential }.each do |cb|
  depends cb
end

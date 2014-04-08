# Helpers module
module Helpers
  # Helpers::Re2 module
  module Re2
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources

    def re2_packages_cpp
      value_for_platform(
        %w(centos fedora redhat) => {
          'default' => %w(re2 re2-devel)
        }
      )
    end
  end
end

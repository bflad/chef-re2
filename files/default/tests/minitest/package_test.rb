require File.expand_path('../support/helpers', __FILE__)

describe_recipe "re2::package" do
  include Helpers::Re2

  re2_packages_python.each do |p|
    it "installs #{p} package" do
      package(p).must_be_installed
    end
  end
end

require 'spec_helper'

describe 're2::archive' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end
end

require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'php::module_pgsql' do
  context package('php-pgsql') do
    it { should_not be_installed }
  end

end


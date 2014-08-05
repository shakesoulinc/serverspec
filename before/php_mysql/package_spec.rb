require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'php::package' do
  context package('php') do
    it { should_not be_installed }
  end

  context package('php-devel') do
    it { should_not be_installed }
  end

  context package('php-cli') do
    it { should_not be_installed }
  end

  context package('php-pear') do
    it { should_not be_installed }
  end

end

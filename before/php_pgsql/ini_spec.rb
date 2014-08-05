require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'php::ini' do
  context file('/etc/php.ini') do
    it {
      should_not be_file
      should_not be_mode 644
      should_not be_owned_by 'root'
    }
  end

end


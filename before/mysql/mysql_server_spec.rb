require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'mysql-server' do

  context package('mysql-server') do
    it { should_not be_installed }
  end
  
  context service('mysqld') do
    it { should_not be_enabled }
    it { should_not be_running }
  end
  
  context port(3306) do
    it { should_not be_listening }
  end
  
  context file('/etc/mysql/conf.d') do
    it { should_not be_directory }
    it { should_not be_owned_by 'mysql' }
    it { should_not be_grouped_into 'mysql' }
    it { should_not be_mode 750 }
  end
  
  context file('/var/lib/mysql') do
    it { should_not be_directory }
    it { should_not be_owned_by 'mysql' }
    it { should_not be_grouped_into 'mysql' }
  end
  
  context file('/var/lib/mysql/mysql.sock') do
    it { should_not be_socket }
  end
  
  context user('mysql') do
      it { should_not exist }
      it { should_not belong_to_group 'mysql' }
  end

end

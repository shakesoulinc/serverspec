require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'mysql-server' do

  context package('mysql-server') do
    it { should be_installed }
  end
  
  context service('mysqld') do
    it { should be_enabled }
    it { should be_running }
  end
  
  context port(3306) do
    it { should be_listening }
  end
  
  context file('/etc/my.cnf') do
    it { should be_file }
    it { should be_owned_by 'mysql' }
    it { should be_grouped_into 'mysql' }
    it { should be_mode 600 }
  end
  
  context file('/etc/mysql/conf.d') do
    it { should be_directory }
    it { should be_owned_by 'mysql' }
    it { should be_grouped_into 'mysql' }
    it { should be_mode 750 }
  end
  
  context file('/var/lib/mysql') do
    it { should be_directory }
    it { should be_owned_by 'mysql' }
    it { should be_grouped_into 'mysql' }
  end
  
  context file('/var/lib/mysql/mysql.sock') do
    it { should be_socket }
  end
  
  context user('mysql') do
      it { should exist }
      it { should belong_to_group 'mysql' }
  end

end

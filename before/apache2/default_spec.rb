require 'spec_helper'
require 'serverspec'
include Serverspec::Helper::DetectOS

describe 'apache2::default' do

#  if ['Debian', 'Ubuntu'].include?(os[:family])
#    context package('apache2') do
#      it { should_not be_installed }
#    end
#  elsif ['RedHat'].include?(os[:family])
#    context package('httpd') do
#      it { should_not be_installed }
#    end
#  end

  context file('/var/log/httpd') do
    it {
      should_not be_directory
      should_not be_mode 755
      should_not be_owned_by 'root'
    }
  end


  context file('/usr/local/bin/apache2_module_conf_generate.pl') do
    it {
      should_not be_file
      should_not be_mode 755
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/sites-available') do
    it {
      should_not be_directory
      should_not be_mode 755
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/sites-enabled') do
    it {
      should_not be_directory
      should_not be_mode 755
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/mods-available') do
    it {
      should_not be_directory
      should_not be_mode 755
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/mods-enabled') do
    it {
      should_not be_directory
      should_not be_mode 755
      should_not be_owned_by 'root'
    }
  end

  context file('/usr/sbin/a2ensite') do
    it {
      should_not be_file
      should_not be_mode 700
      should_not be_owned_by 'root'
    }
  end

  context file('/usr/sbin/a2dissite') do
    it {
      should_not be_file
      should_not be_mode 700
      should_not be_owned_by 'root'
    }
  end

  context file('/usr/sbin/a2enmod') do
    it {
      should_not be_file
      should_not be_mode 700
      should_not be_owned_by 'root'
    }
  end

  context file('/usr/sbin/a2dismod') do
    it {
      should_not be_file
      should_not be_mode 700
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/ssl') do
    it {
      should_not be_directory
      should_not be_mode 755
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/conf.d') do
    it {
      should_not be_directory
      should_not be_mode 755
      should_not be_owned_by 'root'
    }
  end

  context file('/var/cache/httpd') do
    it {
      should_not be_directory
      should_not be_mode 755
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/sysconfig/httpd') do
    it {
      should_not be_file
      should_not be_mode 644
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/conf/httpd.conf') do
    it {
      should_not be_file
      should_not be_mode 644
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/conf.d/security.conf') do
    it {
      should_not be_file
      should_not be_mode 644
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/conf.d/charset.conf') do
    it {
      should_not be_file
      should_not be_mode 644
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/ports.conf') do
    it {
      should_not be_file
      should_not be_mode 644
      should_not be_owned_by 'root'
    }
  end

  context file('/etc/httpd/sites-available/default') do
    it {
      should_not be_file
      should_not be_mode 644
      should_not be_owned_by 'root'
    }
  end

  context service('httpd') do
    it { should_not be_enabled }
  end

end

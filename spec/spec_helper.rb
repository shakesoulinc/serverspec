require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'

include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS

properties = YAML.load_file('properties.yml')

RSpec.configure do |c|
  c.color = true
  c.request_pty = true
  c.before :all do
    block = self.class.metadata[:example_group_block]
    if RUBY_VERSION.start_with?('1.8')
      file = block.to_s.match(/.*@(.*):[0-9]+>/)[1]
    else
      file = block.source_location.first
    end
    host  = properties.keys.join
    if c.host != host
      c.ssh.close if c.ssh
      c.host  = host
      options = Net::SSH::Config.for(c.host)
      options[:keys] = properties[properties.keys.join][:keys].split(" ")
      options[:port] = properties[properties.keys.join][:port]
      user    = properties[properties.keys.join][:user]
      c.ssh   = Net::SSH.start(host, user, options)
    end
  end
end

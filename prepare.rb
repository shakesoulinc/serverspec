require 'yaml'

properties = YAML.load_file('../properties.yml')

host = properties.keys.join
user =  properties[properties.keys.join][:user]
port =  properties[properties.keys.join][:port]

system("knife solo prepare -c knife.rb --bootstrap-version 11.12.4 -p #{port} -i ../ssh.pem #{user}@#{host}")

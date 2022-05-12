#!/opt/puppetlabs/puppet/bin/ruby
require 'json'
require 'socket'

environmentpath = ARGV[0]
environment     = ARGV[1]

compiling_master = Socket.gethostname

r10k_deploy_file_path = File.join(environmentpath, environment, '.r10k-deploy.json')

commit_id = JSON.parse(File.read(r10k_deploy_file_path))['signature'][0...11]

puts "#{compiling_master}-#{environment}-#{commit_id}"

Vagrant.configure('2') do |config|
  config.vm.box      = 'precise32'
  config.vm.box_url  = 'http://files.vagrantup.com/precise32.box'
  config.vm.hostname = 'rails-dev-box'

  config.dns.tld = "dev"

  config.vm.hostname = "apartamesa"

  config.dns.patterns = [/^.*apartamesa.dev$/]


  config.vm.network :forwarded_port, guest: 3000, host: 3000
  #config.vm.network :forwarded_port, guest: 80, host: 8085

  # we run puma with this command
  # bundle exec puma -e development -b unix:///tmp/my_app.sock

  config.vm.network :private_network, ip: "192.168.10.2"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
  end
end

# optional
VagrantDNS::Config.logger = Logger.new("dns.log")
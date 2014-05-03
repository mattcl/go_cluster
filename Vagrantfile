# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.vm.box = "precise64"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/ubuntu-12.04.3-amd64-vbox.box"

  config.butcher.enabled = true
  config.butcher.verify_ssl = false

  config.vm.define "server" do |server|
    server.vm.hostname = "go-server-berkshelf"
    server.vm.network :private_network, ip: "33.33.33.10"

    server.vm.provision :chef_client do |chef|
      chef.chef_server_url        = ENV['CHEF_SERVER']
      chef.validation_client_name = ENV['CHEF_VALIDATOR_CLIENT']
      chef.validation_key_path    = ENV['CHEF_VALIDATOR_KEY']

      chef.run_list = [
          "recipe[go_cluster::server]"
      ]
    end
  end

  config.vm.define "agent" do |agent|
    agent.vm.hostname = "go-agent-berkshelf"
    agent.vm.network :private_network, ip: "33.33.33.11"

    agent.vm.provision :chef_client do |chef|
      chef.chef_server_url        = ENV['CHEF_SERVER']
      chef.validation_client_name = ENV['CHEF_VALIDATOR_CLIENT']
      chef.validation_key_path    = ENV['CHEF_VALIDATOR_KEY']

      chef.run_list = [
          "recipe[go_cluster::agent]"
      ]
    end
  end

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.

  # config.vm.network :public_network

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

end

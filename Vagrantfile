# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 8080, autocorrect: true

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.66.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # Share an additional folder to the guest VM.
  #config.vm.synced_folder "./www", "/var/www", owner: 'www-data', group: 'www-data'
  # NFS shared folder instead
  config.vm.synced_folder "./www", "/var/www", id: "vagrant-root", :nfs => true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  #
  config.vm.provider :virtualbox do |virtualbox|
    ## Don't boot with headless mode
    #vb.gui = true
    virtualbox.customize ["modifyvm", :id, "--name", "ansible-ubuntu-php"]
    virtualbox.customize ["modifyvm", :id, "--memory", "512"]
    # use host OS for dns lookup
    virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # install ansible in the vm, then execute it to prevent the need to have
  #  it installed on the host server
  config.vm.provision :shell, :path => "provisioning/setup_ansible.sh"
  config.vm.provision :shell, :path => "ansible_provisioning.sh"

end

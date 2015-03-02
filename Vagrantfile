# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network "private_network", ip: "192.168.66.10"

  config.vm.define :ubuntu1204_php53 do |t|
  end

  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--name", "ubuntu1204_php53"]
  end

  config.vm.network :forwarded_port, guest: 80, host: 8080, autocorrect: true

  # Share an additional folder to the guest VM.
  #config.vm.synced_folder "./www", "/var/www", owner: 'www-data', group: 'www-data'
  # NFS shared folder instead
  config.vm.synced_folder "./www", "/var/www", id: "vagrant-root", :nfs => true


  # use vagrant-cachier to cache stuff like apt-get updates etc
  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on the "Usage" link above
    config.cache.scope = :box

    # OPTIONAL: If you are using VirtualBox, you might want to use that to enable
    # NFS for shared folders. This is also very useful for vagrant-libvirt if you
    # want bi-directional sync
    config.cache.synced_folder_opts = {
      type: :nfs,
      # The nolock option can be useful for an NFSv3 client that wants to avoid the
      # NLM sideband protocol. Without this option, apt-get might hang if it tries
      # to lock files needed for /var/cache/* operations. All of this can be avoided
      # by using NFSv4 everywhere. Please note that the tcp option is not the default.
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock', 'fsc']
    }
  end

  # install ansible in the vm, then execute it to prevent the need to have
  #  it installed on the host server
  config.vm.provision :shell, :path => "provisioning/setup_ansible.sh"
  config.vm.provision :shell, :path => "ansible_provisioning.sh"

end

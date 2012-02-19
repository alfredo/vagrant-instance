# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "base"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  #config.vm.boot_mode = :gui

  # Assign this VM to a host only network IP, allowing you to access it
  # via the IP.
  config.vm.network "33.33.33.10"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port("http", 80, 8000)

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder("v-data", "/projects", "../projects", :nfs => true)
  config.vm.share_folder("v-archive", "/archive", "../archive", :nfs => true)

  # SSH timeouts
  config.ssh.max_tries = 50
  config.ssh.timeout = 300

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file  = "machine.pp"
    # puppet.options = "--verbose --debug"
  end
end

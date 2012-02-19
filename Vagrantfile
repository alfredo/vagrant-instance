# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "base"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"
  #config.vm.boot_mode = :gui
  config.vm.network :hostonly, "33.33.33.10"

  config.vm.forward_port  80, 8000

  config.vm.share_folder("v-data", "/projects", "../projects", :nfs => true)
  config.vm.share_folder("v-archive", "/archive", "../archive", :nfs => true)

  # SSH timeouts
  config.ssh.max_tries = 50
  config.ssh.timeout = 300

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.manifest_file  = "machine.pp"
    puppet.options = "--verbose"
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "box"
  config.vm.define "box" do |base|
  end

  # Define forwarded ports
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Throw in our provisioning script
  config.vm.provision "shell", path: "./script/provision", privileged: false
  config.vm.provision "shell", path: "./script/run", privileged: false, run: 'always'

  # VirtualBox-specific configuration
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
    # v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    # v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

end

# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.box = "debian/jessie64"
  config.vm.network "private_network", ip: "192.168.100.14"
  config.vm.provision :shell, :path => "libs/01-install.sh"
  config.vm.provision :shell, :path => "libs/02-configure.sh"
  unless File.exist?(file_to_disk)
    config.vm.customize ['createhd', '--filename', file_to_disk, '--size', 500 * 1024]
  end
  config.vm.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', file_to_disk]
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
second_disk = 'tmp/secondDisk.vdi'
third_disk = 'tmp/thirdDisk.vdi'
Vagrant.configure("2") do |config|
  config.vm.define "san" do |san|
    san.vm.box = "debian/jessie64"
    san.vm.hostname = "san"
    #san.vm.network "private_network", ip: "192.168.100.14"

# create a disk for the source code
    san.vm.provider "virtualbox" do |vb|
        unless File.exist?(second_disk)
            vb.customize ['createhd', '--filename', second_disk, '--variant', 'Fixed', '--size', 20 * 1024]
        end
        unless File.exist?(third_disk)
            vb.customize ['createhd', '--filename', third_disk, '--variant', 'Fixed', '--size', 20 * 1024]
        end
        vb.memory = "1024"
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', second_disk]
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', third_disk]
    end
  end
  config.vm.provision :shell, :path => "libs/01-install.sh"
  config.vm.provision :shell, :path => "libs/02-configure.sh"
end

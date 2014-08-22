# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian-ansible"
  config.vm.box_url = "https://dl.dropboxusercontent.com/u/197673519/debian-7.2.0.box"
  config.vm.network :private_network, ip: "192.168.33.13"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
	ansible.sudo = true
#	ansible.verbose = 'vvv'
  end

end

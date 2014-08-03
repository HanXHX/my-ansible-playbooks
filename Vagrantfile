# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT
apt-get update -q
apt-get install -q -y python
SCRIPT


Vagrant.configure("2") do |config|

  config.vm.box = "debian"
  config.vm.network :private_network, ip: "192.168.33.13"

  config.vm.provision "shell", inline: $script

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
	ansible.inventory_file = "ansible_hosts"
	ansible.sudo = true
  end


end

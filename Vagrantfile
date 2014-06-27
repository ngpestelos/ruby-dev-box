# -*- mode: ruby -*-
# vi: set ft=ruby :

SRC_DIR = "~/src"

Vagrant.configure("2") do |config|
  config.vm.box = "phusion-open-ubuntu-14.04-amd64"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", "2"]
  end
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.synced_folder SRC_DIR, "/vagrant", id: "vagrant-root"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.verbose = "vvvv"
  end
end

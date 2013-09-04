# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512", "--cpus", "2"]
  end
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.synced_folder "~/", "/vagrant", id: "vagrant-root"
  config.vm.provision :shell, inline: 'apt-get update'
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks"]
    chef.add_recipe "recipe[locale]"
    chef.add_recipe "recipe[apt]"
    chef.add_recipe "recipe[build-essential]"
    chef.add_recipe "recipe[vim]"
    chef.add_recipe "recipe[openssl]"
  end
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "base.pp"
    puppet.module_path = "puppet/modules"
  end
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "rvm.pp"
    puppet.module_path = "puppet/modules"
  end
end

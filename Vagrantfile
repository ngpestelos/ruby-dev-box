# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ringtail64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks"]
    chef.add_recipe "recipe[apt]"
    chef.add_recipe "recipe[locale]"
  end
end

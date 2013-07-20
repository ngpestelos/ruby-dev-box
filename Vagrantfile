# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ringtail64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks"]
    chef.add_recipe "recipe[locale]"
    chef.add_recipe "recipe[apt]"
    chef.add_recipe "recipe[build-essential]"
    chef.add_recipe "recipe[vim]"
    chef.add_recipe "recipe[openssl]"
    chef.add_recipe "recipe[chef_gem]"
    chef.add_recipe "recipe[rvm::user]"
    chef.add_recipe "recipe[rvm::vagrant]"
    chef.json = {
      :rvm => {
        :user_installs => [{
          :user => "vagrant",
          :rvmrc => {
            :rvm_project_rvmrc => 1,
            :rvm_gemset_create_on_use_flag => 1,
            :rvm_pretty_print_flag => 1,
            :rvm_trust_rvmrcs_flag => 1
          }
        }],
        :vagrant => {
          :system_chef_client => "/opt/ruby/bin/chef-client",
          :system_chef_solo => "/opt/ruby/bin/chef-solo"
        }
      }
    }
  end
end

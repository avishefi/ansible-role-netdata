# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API version
VAGRANTFILE_API_VERSION = 2

rolesBasePath = "/etc/ansible/roles"
netdataRolePath = "#{rolesBasePath}/ansible-role-netdata"

netdataVersion = ENV['NETDATA_VERSION'] || 'latest'
puts "Running with netdata version: #{netdataVersion}"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "boxcutter/centos73"
  config.vm.network "forwarded_port", guest: 19999, host: 19999

  config.vm.synced_folder ".", netdataRolePath

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.provision "netdata", type: "ansible_local" do |ansible|
    ansible.install = true
    ansible.version = "2.2.2.0"
    ansible.install_mode = "pip"

    ansible.provisioning_path = netdataRolePath
    ansible.playbook = "tests/test.yml"
    #ansible.inventory_path = ""
    #ansible.galaxy_role_file = "requirements.yml"
    ansible.galaxy_roles_path = rolesBasePath
    ansible.raw_arguments = [ "--connection=local" ]
    ansible.extra_vars = {
      netdata_version: netdataVersion
    }
    #ansible.verbose = "-vvvvv"
  end

end

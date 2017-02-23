# -*- mode: ruby -*-
# # vi: set ft=ruby :


# Installing required plugins
required_plugins = %w(vagrant-vbguest vagrant-hostmanager)
plugins_to_install = required_plugins.select { |plugin| not Vagrant.has_plugin? plugin }
if not plugins_to_install.empty?
  puts "Installing plugins: #{plugins_to_install.join(' ')}"
  if system "vagrant plugin install #{plugins_to_install.join(' ')}"
    exec "vagrant #{ARGV.join(' ')}"
  else
    abort 'Installation of one or more plugins has failed. Aborting.'
  end
end


# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'

# Read YAML file with box details
servers = YAML.load_file(File.join(File.dirname(__FILE__), 'servers.yml'))


# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # Use rbconfig to determine if we're on a windows host or not.
    require 'rbconfig'
    is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)
    is_macos = (RbConfig::CONFIG['host_os'] =~ /darwin/)

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    #config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
    #  if vm.id
    #     `VBoxManage guestproperty get #{vm.id} "/VirtualBox/GuestInfo/Net/1/V4/IP"`.split()[1]
    #  end
    #end


    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    if is_windows
      config.vm.network "forwarded_port", guest: 80, host: 80, name: "HTTPD"
    else
      # on linux/mac, vagrant must be run as root to use port 80
      # we don't want that : using 8080 instead
      config.vm.network "forwarded_port", guest: 80, host: 8080, name: "HTTPD"
    end
    # opening port for mysql
    config.vm.network "forwarded_port", guest: 3306, host: 3306, name: "MYSQL"


    # Iterate through entries in YAML file
    servers.each do |servers|


    memory = servers['memory'] ? servers['memory'] : 1024
    cpus = servers['cpus'] ? servers['cpus'] : 1
    hostname =  servers['hostname'] ? servers['hostname'] : "test.dev"



        config.vm.define servers["name"] do |srv|
            srv.vm.box = servers["box"]
            srv.vm.hostname = hostname


            if servers["ip"] != nil
              srv.vm.network "private_network", ip: servers["ip"]
            else
              srv.vm.network :private_network, :auto_network => true
            end

            srv.vm.provider :virtualbox do |vb|
                vb.name = servers["name"]
                vb.memory = memory
                vb.cpus = cpus
                vb.gui = false
                #vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

            end
            if servers["prov"] == "ansible"
                srv.vm.provision "ansible" do |ansible|
                    ansible.playbook = "ansible/site.yml"
                    ansible.inventory_path = "ansible/inventory/"+servers["environment"]
                    ansible.limit = "all"
                    ansible.extra_vars = { ansible_ssh_user: 'vagrant' }
                    ansible.sudo = true
                end
            end
        end
    end

    config.vm.provision :shell, inline: "echo Good job"

    config.vm.provision :hostmanager, run: "always"


end

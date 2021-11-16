Vagrant.configure(2) do |config|
    # config.vm.define "redis" do |dbserver|
    #     dbserver.vm.box = "bento/ubuntu-18.04"
    #     dbserver.vm.provision "shell", path: "./bootstrap.sh", env: {puppet_env: "test"}

    #     #config.vm.network "private_network", type: "dhcp", virtualbox__intnet: true
    #     config.vm.network "private_network", type: "dhcp"
    #     dbserver.vm.hostname = "redis"

    #     dbserver.vm.provision :puppet do |puppet|
    #         puppet.environment_path = "environments"
    #         puppet.environment = "test"
    #         puppet.options = "--verbose --debug"
    #     end
    # end

#    config.vm.hostname = 'vagrant-test'
    config.vm.provider :digital_ocean do |provider, override|
        override.ssh.private_key_path = '~/.ssh/id_rsa'
        override.vm.box = 'digital_ocean'
        override.vm.box_url = 'https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box'

        provider.token = ENV['TOKEN']
        provider.image = 'ubuntu-18-04-x64'
        provider.region = 'nyc1'
        provider.size = 's-1vcpu-1gb'
        provider.setup = false
    end

#    config.vm.synced_folder "./environments/test", "/etc/puppetlabs/code/environments/test"

    config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
    end

    config.vm.network :forwarded_port, guest: 9870, host: 9870 # NameNode web interface
    config.vm.network :forwarded_port, guest: 8088, host: 8088 # YARN web interface

    config.vm.define "hadoop" do |hadoop|
        config.puppet_install.puppet_version = '6.24.0'    
        hadoop.vm.box = "bento/ubuntu-18.04"
#        hadoop.vm.provision "shell", path: "./bootstrap.sh", env: {puppet_env: "test"}
        
        #config.vm.network "private_network", type: "dhcp", virtualbox__intnet: true
        config.vm.network "private_network", type: "dhcp"
        hadoop.vm.hostname = "hadoop"

        hadoop.vm.provision :puppet do |puppet|
            puppet.environment_path = "environments"
            puppet.environment = "test"
            puppet.manifests_path = "."
            puppet.manifest_file  = "default.pp"
#            puppet.module_path = "modules"
#            puppet.environment = "test"
#            puppet.manifests_path = '.'
#            puppet.manifest_file = 'default.pp'
            puppet.options = "--verbose --debug"
        end
        
    end
end

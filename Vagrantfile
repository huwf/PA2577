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

    config.vm.synced_folder "./environments/test", "/etc/puppetlabs/code/environments/test"

    config.vm.define "appserver" do |appserver|
        appserver.vm.box = "bento/ubuntu-18.04"
        appserver.vm.provision "shell", path: "./bootstrap.sh", env: {puppet_env: "test"}
        
        #config.vm.network "private_network", type: "dhcp", virtualbox__intnet: true
        config.vm.network "private_network", type: "dhcp"
        appserver.vm.hostname = "appserver"

        appserver.vm.provision :puppet do |puppet|
            puppet.environment_path = "environments"
            puppet.environment = "test"
            puppet.options = "--verbose --debug"
        end
    end
    config.vm.define "dbserver" do |dbserver|
        config.puppet_install.puppet_version = '6.24.0'
        dbserver.vm.box = "bento/ubuntu-18.04"
        dbserver.vm.provision "shell", path: "./bootstrap.sh", env: {puppet_env: "test"}

        dbserver.vm.hostname = "dbserver"
        config.vm.network "private_network", type: "dhcp"

        dbserver.vm.provision :puppet do |puppet|
            puppet.environment_path = "environments"
            puppet.environment = "test"
            puppet.options = "--verbose --debug"
        end
    end
end

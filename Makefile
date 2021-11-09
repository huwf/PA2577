TOKEN=`cat token`

plugin:
	vagrant plugin install vagrant-puppet-install

up: plugin
	TOKEN=$(TOKEN) vagrant up

virtualbox: plugin
	TOKEN=$(TOKEN) vagrant up --provider virtualbox

do_plugin: plugin
	vagrant plugin install vagrant-digitalocean

digitalocean: do_plugin
	TOKEN=$(TOKEN) vagrant up --provider digital_ocean

destroy:
	TOKEN=$(TOKEN) vagrant destroy -f

ssh-dbserver:
	TOKEN=$(TOKEN) vagrant ssh dbserver

ssh-appserver:
	TOKEN=$(TOKEN) vagrant ssh appserver

provision:
	TOKEN=$(TOKEN) vagrant provision


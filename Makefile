TOKEN=`cat token`

plugin:
	vagrant plugin install vagrant-puppet-install

up: plugin
	TOKEN=$(TOKEN) vagrant up

virtualbox: plugin
	TOKEN=$(TOKEN) vagrant up --provider virtualbox

digitalocean: plugin
	TOKEN=$(TOKEN) vagrant up --provider digitalocean

destroy:
	TOKEN=$(TOKEN) vagrant destroy -f

ssh-dbserver:
	TOKEN=$(TOKEN) vagrant ssh dbserver

ssh-appserver:
	TOKEN=$(TOKEN) vagrant ssh appserver

provision:
	TOKEN=$(TOKEN) vagrant provision


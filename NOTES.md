# Notes

In this file I'll keep any notes I find useful because I'll probably forget them later.

## Vagrant

The Vagrant puppet provisioner appears to only apply the files once when it deploys, but doesn't change any global settings. 
This means that the environment is wrong and `puppet apply` doesn't work, and the files
are not in the location that puppet is expecting.
In that case, I'll probably need to mount the directory in Vagrant into the default `/etc/puppetlabs/code/environments/`
that puppet uses.

### Networking
Remember that Virtualbox sets up a NAT only network by default. Set a private network as well, otherwise eth0 will only return to the host IP address.

## Puppet

For some reason the hostname on Virtualbox comes up as `appserver.home`. Using `/appserver/` 
in the node definition in `default.pp` appears to solve this, as the Puppet regular expression
will seek to find subdomains in the hostname.

TODO: Find out if it would work when running `puppet apply` later...

### Puppet apply

To keep masterless Puppet updated we need to regularly update from git. Symlink the mounted directory from Vagrant to the environment, and run `git pull` on it every 15 minutes.

    file {/etc/puppetlabs/code/environments/test:
      ensure => 'link'
      target => '/home/vagrant/environments/test'
    }

### R10K

R10k needs Ruby dev to be installed


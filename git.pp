# The git environment can be mounted in the shared folder, but then symlinked to the Puppet dir

$puppet_env = "/etc/puppetlabs/code/environments/test"
$gitdir = "/vagrant/"


file { "/vagrant/environments/test":
  ensure => present,  
}

file { $puppet_env:
  ensure => link,
  target => '/vagrant/environments/test'
}

# The initial setup can be simply to setup Puppet and cron, but we want to run full setup manually once as well

exec { 'init':
  command => '/opt/puppetlabs/bin/puppet apply --environment test && touch /vagrant/.exists',
  creates => '/vagrant/.exists'
}

cron { 'setup-cron':
  command => "cd ${gitdir} && /opt/puppetlabs/bin/puppet apply --environment test",
  hour    => '*',
  minute  => '*/15',  
}


package {'git': ensure => installed}

package{'ruby':
  ensure => installed
}

package { 'r10k':
  ensure   => installed,
  provider => puppet_gem,
}

package {'generate-puppetfile': 
  ensure => present, 
  provider => puppet_gem
}

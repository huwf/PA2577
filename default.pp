# Setup Git/Puppet and 

# The git environment can be mounted in the shared folder, but then symlinked to the Puppet dir

$puppet_env = "/etc/puppetlabs/code/environments/test"
$gitdir = "/vagrant/"

exec {'echo "export PATH=$PATH:/opt/puppetlabs/bin" > /etc/profile.d/puppet-bin.sh'
  creates => /etc/profile.d/puppet-bin.sh
}

file { "/vagrant/environments/test":
  ensure => present,  
}

file { $puppet_env:
  ensure => link,
  target => '/vagrant/environments/test'
}

# The initial setup can be simply to setup Puppet and cron, but we want to run full setup manually once as well

$cmd = "/opt/puppetlabs/bin/puppet apply --environment test ${puppet_env}/manifests/ && touch /vagrant/.exists.${hostname}"
# $cmd = "/opt/puppetlabs/bin/puppet apply --environment test /etc/puppetlabs/code/environments/test/manifests/"

exec { 'init':
  command => "${cmd}",
  path => $path
  creates => "/vagrant/.exists.${hostname}",
}

cron { 'setup-cron':
  command => "${cmd}",
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

# Setup passwordless SSH between our servers (for multi-server Hadoop)
exec{"ssh-keygen":
  command => "ssh-keygen -t rsa -P '' -f /vagrant/id_rsa",
  creates => '/vagrant/id_rsa',
  path => $path,
}

file {"/home/vagrant/.ssh/id_rsa.pub":
  ensure => present,
  source => '/vagrant/id_rsa.pub',
  mode => "600",
  owner => vagrant,
  group => vagrant  
}

file {"/home/vagrant/.ssh/id_rsa":
  ensure => present,
  source => '/vagrant/id_rsa',
  mode => "600",
  owner => vagrant,
  group => vagrant
}


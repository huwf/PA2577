$gitenv = "/home/vagrant/.puppetlabs/etc/code/environments"

file { "/vagrant/environments"
  ensure => present,  
}

file { $gitenv:
  ensure => link,
  target => '/vagrant/environments/test'
}

cron {
  command: 'git pull && /opt/puppetlabs/bin/puppet apply --environment test',
  cwd: $env,
  hour    => '*',
  minute  => '*/15',  
}

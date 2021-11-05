class class_appserver {
  package { 'curl':
    ensure => present
  }

  exec {'get-node-curl':
    command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
#    require => Package['curl']
  }

  exec {'apt-get update':
    command => '/usr/bin/apt-get update',
#    require => Exec['get-node-curl']
  }

  package {'nodejs': ensure => present}
  package {'cowsay': ensure => present}

}


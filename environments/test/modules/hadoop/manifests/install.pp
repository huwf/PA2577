class hadoop::install {

  # Install Hadoop pre-requisite stuff

  exec {'apt update':
    command => 'apt update',
    path => $path
  }

  package {'ssh': ensure => present}
  package {'pdsh': ensure => purged}

  package {'openjdk-8-jdk':
    ensure => present
  }

  package {'libbcprov-java':
    ensure => present
  }

  # Extract hadoop and add to $PATH
  exec {'hadoop':
    command => "wget -O /tmp/hadoop.tar.gz ${hadoop::hadoop_url}",
    path => $path,
    creates => "/tmp/hadoop.tar.gz"  
  }

  exec {'unpack-hadoop':
    command => "tar -zxf /tmp/hadoop.tar.gz -C /opt",
    path => $path,
    creates => "/opt/${hadoop::hadoop_version}"
  }


}

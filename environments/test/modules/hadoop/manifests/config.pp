class hadoop::config {
  # TODO: Maybe this goes in a different class?
  # TODO: Check whether these permissions are legit
  file {"${hadoop::hadoop_home}/etc/hadoop":
    source => "/vagrant/environments/test/modules/hadoop/files/etc/hadoop",
    mode => "644",
    ensure => directory,
    recurse => remote
  }

  file {"/etc/profile.d/hadoop-common.sh":
    ensure => present,
    source => "/vagrant/environments/test/modules/hadoop/hadoop-common.sh",
  }

  # TODO: Get a better system for multiple authorized keys
  # Not entirely sure this should go here, but file() looks for files before executing previous commands
  ssh_authorized_key {"authorized-key":
    ensure => present,
    type   => "ssh-rsa",
    user   => "vagrant",
    # key    =>  "${regsubst(regsubst(file('/root/.ssh/id_rsa.pub'), 'ssh-rsa ', ''), " root@${hostname}", '')}",
    key    => "${regsubst(file('/home/vagrant/.ssh/id_rsa.pub'), "ssh-rsa (.*?) root@${hostname}\n*", '\\1', 'G')}",
  }

  # 
  exec {"hdfs namenode -format && start-dfs.sh && touch /tmp/.hdfs-created":
    creates => "/tmp/.hdfs-created",
    path => $path,
    user => 'vagrant'
  }

# TODO: Find out where hdfs directory is on the filesystem
#  exec {"hdfs -mkdir -p /user/vagrant":
#    creates => "/user/vagrant",
#    path => $path,
#    user => "vagrant"
#  }

#  exec {"hdfs -mkdir ./input":
#    creates => 
#  }

}

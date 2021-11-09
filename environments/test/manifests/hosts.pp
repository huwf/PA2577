# Virtualbox eth0 is NAT and Digitalocean is the public IP address
# eth1 seems to be safe for both of them
$eth1_ip = $facts['networking']['interfaces']['eth1']['ip']

exec {'hosts':
  command => "/bin/echo ${eth1_ip} ${hostname} >> /vagrant/hosts",
  creates => "/vagrant/.${hostname}"
}

file{'/etc/hosts':
  ensure => present,
  source => "/vagrant/hosts"
}

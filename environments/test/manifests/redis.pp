# Only install the client on the non-dedicated node

$hn = $facts['networking']['hostname']
$ip = $facts['networking']['ip']
$run_service = $hostname == "redis"



class { '::redis':
  bind => '0.0.0.0',
  service_enable => $run_service 
}

# Send across the 
exec {'hostname-redis':
  command => "/usr/bin/redis-cli -n 0 set ${hn} \"${ip}\"",
}

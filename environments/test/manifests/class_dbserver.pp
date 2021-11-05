if ($facts['networking']['hostname'] == "dbserver") {
  # include mysql::server  
  notice("Including mysql::server")
  class { 'mysql::server':
      root_password => 'hairline-quotient-inside-tableful',
      remove_default_accounts => true
  }
}
else {
  notice($facts['networking']['hostname'])
}


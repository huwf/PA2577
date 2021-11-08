
node default {
  include class_default
}

node redis.home {
  include redis
}

node appserver.home {
  include class_appserver
}

node dbserver.home {    
  include mysql::server
}

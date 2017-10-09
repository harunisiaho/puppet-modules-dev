# == Class: base
#
class base {
  # resources
  include sudo, ssh
}

node 'puppet-master.karen.jtl.co.ke' {
  include base
  include puppet::master
}

node 'web1.karen.jtl.co.ke' {
  include base
  include apache

  apache::vhost{'web1.karen.jtl.co.ke':
    port => 80,
    docroot => '/var/www/web1.harun.co.ke',
    ssl => false,
    priority => 10,
    serveraliases => 'www.web1.karen.jtl.co.ke',

  }
}

node 'mail1.karen.jtl.co.ke' {
  include base
  include postfix
}

node 'db1.karen.jtl.co.ke' {
  include base
  include mysql
}

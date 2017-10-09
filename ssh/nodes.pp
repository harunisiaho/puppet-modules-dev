# == Class: base
#
class base {
  # resources
  include sudo ssh
}

node 'web1.karen.jtl.co.ke' {
  include base
}

node 'mail1.karen.jtl.co.ke' {
  include base
}

node 'db1.karen.jtl.co.ke' {
  include base
}

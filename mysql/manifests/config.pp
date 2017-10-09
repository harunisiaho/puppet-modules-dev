# == Class: mysql::config
#
class mysql::config {
  # resources
  file { '/etc/my.cnf':
    ensure => file,
    source => "puppet:///modules/mysql/my.cnf",
    mode => '0644',
    owner => "mysql",
    group => "mysql",
    require => Class["mysql::install"],
    notify => Class["mysql::service"],
  }
}

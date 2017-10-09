# == Class: mysql:service
#
class mysql::service {
  # resources
  service { 'mysql':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus  => true,
    require => Class["mysql::config"],
  }
}

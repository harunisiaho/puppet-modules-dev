# == Class: postfix::service
#
class postfix::service {
  # resources
  service { 'postfix':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus  => true,
    require => Class["postfix::config"],
  }
}

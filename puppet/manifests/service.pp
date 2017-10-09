# == Class: puppet::service
#
class puppet::service {
  # Ensure puppet service is started
  service { 'puppet':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus  => true,
    require => Class["puppet::install"],
  }
}

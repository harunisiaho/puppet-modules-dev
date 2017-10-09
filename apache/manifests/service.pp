# == Class: appache::service
#
class apache::service {
  service { 'httpd':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus  => true,
    require => Class["apache::install"]
    }
}

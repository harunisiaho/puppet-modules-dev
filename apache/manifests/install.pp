# == Class: apache::install
#
class apache::install {
  package { 'httpd':
    ensure => installed,
  }
}

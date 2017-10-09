# == Class: sudo
#
class sudo {
  # resources
  package { 'sudo':
    ensure => present,
  }

  if $operatingsystem == "Ubuntu" {
    # enter puppet code
    package { 'sudo-ldap':
      ensure => present,
      require => package["sudo"],
    }
  }

  file { '/etc/sudoers':
    owner => "root",
    group => "root",
    ensure => file,
    mode => '0440',
    source => "puppet://$puppetserver/modules/sudo/etc/sudoers"
  }
}

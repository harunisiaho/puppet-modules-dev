# == Class: puppet::master
#
class puppet::master {
  include puppet
  include puppet::params

  package { 'puppetserver':
    ensure => installed,
  }

  service { 'puppetserver':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus  => true,
    require => File["/etc/puppetlabs/puppet/puppet.conf"],
  }
}

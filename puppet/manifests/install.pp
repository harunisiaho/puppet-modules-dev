# == Class: puppet::install
#
class puppet::install {
  # Install puppet agent
  package { 'puppet-agent':
    ensure => installed,
  }
}

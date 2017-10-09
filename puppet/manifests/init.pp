# == Class: puppet
#
class puppet {
  include puppet::install, puppet::config, puppet::service
}

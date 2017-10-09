# == Class: Main ssh class
#
class ssh {
  # resources
  require ssh::params
  include ssh::install, ssh::config, ssh::service
}

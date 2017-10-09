# == Class: mysql
#
class mysql {
  # resources
  include mysql::install, mysql::config, mysql::service
}

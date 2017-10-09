# == Class: mysql::install
#
class mysql::install {
  # resources
  package { ["mysql-server"]:
    ensure => installed,
    # require => user["mysql"],
  }

  # user { 'mysql':
  #   comment => 'Mysql User',
  #   home => '/home/mysql',
  #   ensure => present,
  #   shell => '/bin/false',
  #   gid => 'mysql',
  #   require => Group["mysql"],
  # }

  # group { 'mysql':
  #   ensure => present,
  # }
}

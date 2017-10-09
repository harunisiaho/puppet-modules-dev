# == Class: postfix::config
#
class postfix::config {
  $require => Class["postfix::install"]
  File{
    owner => "postfix",
    group => "postfix",
    mode => 0644,
    backup => main,
  }

  file { '/etc/postfix/master.cf':
    ensure => present,
    source => "puppet:///modules/postfix/master.cf",
    # require => Class["postfix::install"],
    notify => Class["postfix::service"],
    mode => '0644',
  }

  file { '/etc/postfix/main.cf':
    ensure => present,
    content => template("postfix/main.cf.erb"),
    # require => Class["postfix::install"],
    notify => Class["postfix::service"]
  }
}

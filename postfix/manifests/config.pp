# == Class: postfix::config
#
class postfix::config {
  $require = Class["postfix::install"]
  File{
    owner => "postfix",
    group => "postfix",
    mode => '0644',
    backup => main,
    ensure => present,
  }

  file { '/etc/postfix/master.cf':
    source => "puppet:///modules/postfix/master.cf",
    notify => Class["postfix::service"],
  }

  file { '/etc/postfix/main.cf':
    content => template("postfix/main.cf.erb"),
    notify => Class["postfix::service"],
  }
}

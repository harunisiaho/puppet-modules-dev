# == Class: postfix::install
#
class postfix::install {
  # Install Posfix amd Mailx package
  package { ["postfix","mailx"]:
    ensure => installed,
  }
}

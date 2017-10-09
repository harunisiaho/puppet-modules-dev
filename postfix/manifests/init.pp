# == Class: postfix
#
class postfix {
  # resources
  include postfix::install, postfix::config, postfix::service
}

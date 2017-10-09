# == Class: apache
#
class apache {
  include apache::install, apache::service
}

#
# class: package
#
# This puppet class is responsible for installing ovirt-guest-agent
# package (rpm/deb/...). There's no need to run it directly as it is
# required by class service.
#

class ovirt_guest_agent::package inherits ovirt_guest_agent {

  package { $ovirt_guest_agent::package_name:
    ensure => $ovirt_guest_agent::package_ensure,
  }

}

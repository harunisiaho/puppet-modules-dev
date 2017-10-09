#
# class: service
#
# This puppet class makes sure that ovirt-guest-agent is started during
# boot and always running unless configured otherwise. Furthermore it
# requires class package to make sure that ovirt-guest-agent is installed.
#

class ovirt_guest_agent::service inherits ovirt_guest_agent {

  if ! ($ovirt_guest_agent::service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure must be running or stopped!')
  }

  service { $ovirt_guest_agent::service_name:
    ensure     => $ovirt_guest_agent::service_ensure,
    enable     => $ovirt_guest_agent::service_enabled,
    hasstatus  => true,
    hasrestart => true,
  }

}

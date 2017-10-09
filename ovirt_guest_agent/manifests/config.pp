#
# class: config
#
# This puppet class is responsible for deploying the ovirt-guest-agent
# configuration file on the system.
#

class ovirt_guest_agent::config inherits ovirt_guest_agent {

  file { $ovirt_guest_agent::config_file:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($ovirt_guest_agent::config_template),
  }

}

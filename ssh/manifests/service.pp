# == Class: Ensure ssh service is enabled and started
#
class ssh::service {
  # resources
  service { $ssh::params::ssh_service_name:
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus  => true,
    require => Class["ssh::config"],
    # pattern => 'sshd',
  }
}

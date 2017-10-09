#
# class: params
#
# This puppet class sets default values to configure ovirt-guest-agent.
# All values can be overriden if required.
#

class ovirt_guest_agent::params {

  # default values: running and enabled
  $package_ensure  = 'installed'
  $service_ensure  = 'running'
  $service_enabled = true
  $config_file     = '/etc/ovirt-guest-agent.conf'
  $config_template = 'ovirt_guest_agent/ovirt-guest-agent.conf.erb'

  # config template values
  $heart_beat_rate         = undef
  $report_user_rate        = undef
  $report_num_cpu_rate     = undef
  $report_application_rate = undef
  $report_disk_usage       = undef
  $applications_list       = undef
  $ignored_fs              = undef
  $ignore_zero_size_fs     = undef

  # package and service names may vary on different operating systems
  $os = $::operatingsystem

  case $os {
    'Redhat': {
      $service_name = 'ovirt-guest-agent'
      $package_name = 'rhevm-guest-agent-common'
    }
    'CentOS', 'Scientific': {
      $service_name = 'ovirt-guest-agent'
      $package_name = 'ovirt-guest-agent-common'
    }
    'Debian': {
      $service_name = 'ovirt-guest-agent'
      $package_name = 'ovirt-guest-agent'
    }
    'Ubuntu': {
      $service_name = 'ovirt-guest-agent'
      $package_name = 'ovirt-guest-agent'
    }
    default: {
      fail("Unsupported guest operating system: ${os}")
    }
  }

}

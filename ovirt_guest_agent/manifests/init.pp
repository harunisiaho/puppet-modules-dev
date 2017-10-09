# Class: ovirt_guest_agent
# ===========================
#
# This is the main class for ovirt-guest-agent puppet module.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'ovirt_guest_agent':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Rene Koch <rkoch@rk-it.at>
#
# Copyright
# ---------
#
# Copyright 2016 Rene Koch
#

class ovirt_guest_agent (

  $service_name            = $ovirt_guest_agent::params::service_name,
  $service_ensure          = $ovirt_guest_agent::params::service_ensure,
  $service_enabled         = $ovirt_guest_agent::params::service_enabled,
  $package_name            = $ovirt_guest_agent::params::package_name,
  $package_ensure          = $ovirt_guest_agent::params::package_ensure,
  $config_file             = $ovirt_guest_agent::params::config_file,
  $config_template         = $ovirt_guest_agent::params::config_template,
  $heart_beat_rate         = $ovirt_guest_agent::params::heart_beat_rate,
  $report_user_rate        = $ovirt_guest_agent::params::report_user_rate,
  $report_num_cpu_rate     = $ovirt_guest_agent::params::report_num_cpu_rate,
  $report_application_rate = $ovirt_guest_agent::params::report_application_rate,
  $report_disk_usage       = $ovirt_guest_agent::params::report_disk_usage,
  $applications_list       = $ovirt_guest_agent::params::applications_list,
  $ignored_fs              = $ovirt_guest_agent::params::ignored_fs,
  $ignore_zero_size_fs     = $ovirt_guest_agent::params::ignore_zero_size_fs,

) inherits ovirt_guest_agent::params {

  validate_string($service_name)
  validate_string($service_ensure)
  validate_bool($service_enabled)
  validate_string($package_name)
  validate_string($package_ensure)
  validate_string($config_file)
  validate_string($config_template)
  if $heart_beat_rate { validate_integer($heart_beat_rate) }
  if $report_user_rate { validate_integer($report_user_rate) }
  if $report_num_cpu_rate { validate_integer($report_num_cpu_rate) }
  if $report_application_rate { validate_integer($report_application_rate) }
  if $report_disk_usage { validate_integer($report_disk_usage) }
  validate_string($applications_list)
  validate_string($ignored_fs)
  validate_string($ignore_zero_size_fs)

  if ($::manufacturer) == 'oVirt' or ($::productname == 'RHEV Hypervisor') {
    anchor { 'ovirt_guest_agent::begin': } ->
    class { '::ovirt_guest_agent::package': } ->
    class { '::ovirt_guest_agent::config': } ~>
    class { '::ovirt_guest_agent::service': } ->
    anchor { 'ovirt_guest_agent::end': }
  }else{
    notice ('This system doesn\'t seem to run on oVirt/RHEV - skipping installation')
  }

}

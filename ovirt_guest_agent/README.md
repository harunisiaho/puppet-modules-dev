# ovirt_guest_agent

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with ovirt_guest_agent](#setup)
    * [What ovirt_guest_agent affects](#what-ovirt_guest_agent-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ovirt_guest_agent](#beginning-with-ovirt_guest_agent)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs and configure ovirt-guest-agent.

## Module Description

ovirt-guest-agent is a daemon that resides within guest virtual machines and is
required to supply information to the Virtualization Manager (such as oVirt-engine
or Red Hat Enterprise Virtualization Manager) that is required to properly manage
the virtual machines.

This module installs ovirt-guest-agent-common (or rhevm-guest-agent-common), enables
and starts the ovirt-guest-agent daemon.

## Setup

### What ovirt_guest_agent affects

* Packages
    * ovirt-guest-agent-common
    * qemu-guest-agent
* Files
    * /etc/ovirt-guest-agent.conf
* Services
    * ovirt-guest-agent daemon

### Setup Requirements

This module doesn't enable (possibly) repositories due to the following reasons:
* Required repository may be already enabled (e.g. EPEL)
* Repositories aren't handled by yum directly (e.g. when using Red Hat Satellite,
Spacewalk, Katello,...)
* There are plenty of modules available for enabling repositories

The following repositories are required (also see Limitations section below):

* CentOS 6/7:
    * EPEL (https://fedoraproject.org/wiki/EPEL)

* Red Hat Enterprise Linux 6/7 (ovirt-guest-agent):
    * EPEL (https://fedoraproject.org/wiki/EPEL)

* Red Hat Enterprise Linux 6 (rhevm-guest-agent):
    * rhel-6-server-rhev-agent-rpms (subscription-manager) or
    * rhel-x86_64-rhev-agent-6-server (RHN classic)

* Red Hat Enterprise Linux 7 (rhevm-guest-agent):
    * rhel-7-server-rh-common-rpms (subscription-manager)

* Debian 8:
    * available in jessie repository, but see limitations!

* Debian 7:
    * http://download.opensuse.org/repositories/home:/evilissimo:/deb/Debian_7.0/

* Ubuntu 12.04:
    * http://download.opensuse.org/repositories/home:/evilissimo:/ubuntu:/12.04/xUbuntu_12.04/

* Ubuntu 14.04:
    * http://download.opensuse.org/repositories/home:/evilissimo:/ubuntu:/14.04/xUbuntu_14.04/

* Ubuntu 16.04:
    * http://download.opensuse.org/repositories/home:/evilissimo:/ubuntu:/16.04/xUbuntu_16.04/

### Beginning with ovirt_guest_agent

For mninimal usage try:

```puppet
    include '::ovirt_guest_agent'
```
 which will install the guest agent and enable it.

To pass additional parameters try something like this:

```puppet
    class {'::ovirt_guest_agent':
        report_disk_usage => 1,
    }
```

## Usage

Install ovirt-guest-agent with default configuration file:

```puppet
    class {'::ovirt_guest_agent': }
```

Install rhevm-guest-agent instead of ovirt-guest-agent with default
configuration file:

```puppet
    class {'::ovirt_guest_agent':
      service_name => 'rhevm-guest-agent'
      package_name => 'rhevm-guest-agent-common'
    }
```

## Reference

### Classes

* ovirt_guest_agent: This is the main class which includes all other classes.
* ovirt_guest_agent::service: Starts/stops and enables/disables ovirt-guest-agent daemon.
* ovirt_guest_agent::package: Installs/uninstalls ovirt-guest-agent package.

### Paramaters

The following parameters are available in ::ovirt_guest_agent class:

#### `service_name`
Name of the ovirt-guest-agent service. Override this value if you want to install
rhevm-guest-agent.
Default value: `ovirt-guest-agent`

#### `service_enabled`

Boolen value for enabling or disabling ovirt-guest-agent service.
Default value: true

#### `service_ensure`

Handles status of ovirt-guest-agent service. Can be running or stopped.
Default value: running

#### `package_name`

Name of the ovirt-guest-agent package. Override this value if you want to install
rhevm-guest-agent. The name differs on RedHat based systems and Debian based system.
Class ::ovirt_guest_agent::params takes care of the right default values.
Default value (RedHat): `ovirt-guest-agent-common`
Default value (Debian): `ovirt-guest-agent`

#### `package_ensure`

Handles status of ovirt-guest-agent package. Can be installed or absent.
Default value: `installed`

## Limitations

See operatingsystem_support for list of supported operating systems.

If you're using Debian 8, please note that there are 2 bugs in the ovirt-guest-agent package provided by jessie repository:

* https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=811481
* https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=782005

These bugs are fixed ini package of sid repository.


If you're using Debian 7, please follow the instructions on how to add the required repository:
https://software.opensuse.org/download.html?project=home%3Aevilissimo%3Adeb&package=ovirt-guest-agent
or

https://www.ovirt.org/documentation/how-to/guest-agent/install-the-guest-agent-in-debian/

If you're using Ubuntu, please follow the instructions on how to add the required repository:
https://www.ovirt.org/documentation/how-to/guest-agent/install-the-guest-agent-in-ubuntu/

## Development

Fork this module on Github and send a pull request.



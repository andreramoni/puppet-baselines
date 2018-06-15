
# Rbaselines

#### Table of Contents

1. [Description](#description)
1. [Preconfiguration steps](#preconfiguration-steps)
1. [Parametarized classes](#parametarized-classes)
1. [Classes](#classes)
   * [common::ntp](#common-ntp)
   * [common::timezone](#common-timezone)
   * [common::vmwaretools](#common-vmwaretools)
   * [linux::users::root](#linux-users-root)
   * [linux::custom_profile](#linux-custom_profile)
   * [linux::inputrc](#linux-inputrc)
   * [linux::packages](#linux-packages)
   * [linux::puppet_agent](#linux-puppet_agent)
   * [linux::redhat_insights](#linux-redhat_insights)
   * [linux::sshd](#linux-sshd)
   * [linux::sysctl_common](#linux-sysctl_common)
   * [linux::sysctl](#linux-sysctl)
   * [windows::chocolatey](#windows-chocolatey)
   * [windows::rdp](#windows-rdp)
   * [windows:winrm](#windows-winrm)
   * [check_linux](#check_linux)
   * [check_windows](#check_windows)
   * [params](#params)



## Description
This module provides baselines classes to be picked up and used by many systems.<br>
The ideia is not to apply all classes to all systems, but just agregate in this module the classes that could be used by many systems.<br>

Examples:
- Users
- Repositories
- Timezone and NTP servers

## Preconfiguration steps
To chocolatey packges to work, put this on site.pp:<br>
if ( $::kernel == 'Windows' ){<br>
  Package { provider => 'chocolatey' }<br>
}<br>



## Parametarized classes
Parametarized classes offers a way to reuse code by putting some data outside the class definition.<br>
Hiera is usually used on Puppet, but since we use Foreman, we´ll let Foreman handle these parameters.<br>
That way, we can easily change the root password for a group of hosts or NTP servers for all the hosts just editing a paratmeter in the web interface instead of deploying new configuration throught the entire deploy process.<br>

## Classes

### common dns
Manages DNS servers.<br>
Class: infra_baselines::common::dns<br>
OS Support: Linux and Windows.<br>
Parameters (handled by Foreman):
- manage_dns: Whether to manage dns or not. 
- dns_servers: Array of DNS servers. 

### common ntp
Manages NTP servers.<br>
Class: infra_baselines::common::ntp<br>
OS Support: Linux and Windows.<br>
Parameters (handled by Foreman):
- manage_ntp: Whether to manage ntp or not. 
- ntp_servers: Array of NTP servers. 

### common timezone
Manages the timezone.<br>
Class: infra_baselines::common::timezone<br>
OS Support: Linux and Windows.<br>
Parameters (handled by Foreman): 
- manage_timezone: boolean. To manage timezone or not.
- timezone: the timezone. Specific for each OS. Example: Etc/UTC for Linux is just UTC on Windows.

### common vmwaretools
Ensure vmwaretools is installed and running. Uses open-vm-tools package on Linux and vmware-tools chocolatey package on windows.<br>
Class: infra_baselines::common::vmwaretools<br>
OS Support: Linux and Windows.<br>
No parameters.<br>

### linux users root
Ensure the root user and password.<br>
Class: infra_baselines::linux::users::root<br>
OS Support: Linux<br>
Parameters (handled by Foreman):
- manage_root: boolean. Wherer to manage the host root user or not.
- root_password: String. Hash of the password.

### linux custom_profile
Set some bash customizations like idle timeout, history format, df and dmesg aliases etc.<br>
Class: infra_baselines::linux::custom_profile<br>
OS Support: Linux<br>

### linux inputrc
Configure some options in inputrc.<br>
Class: infra_baselines::linux::inputrc<br>
OS Support: Linux<br>
No parameters.<br>

### linux packages
Installs and removes some packages.<br>
Class: infra_baselines::linux::packages<br>
OS Support: Linux<br>
List of packages taken from params.pp<br>

### linux puppet_agent
Configures some options in the linux puppet agent.<br>
Class: infra_baselines::linux::puppet_agent<br>
OS Support: Linux<br>
Parameters (taken from params.pp):
- puppet_server: 
- puppet_runinterval: run interval of the puppet agent. Default is 1800

### linux redhat_insights
Installs the RedHat insights agent on RedHat Linuxes.<br>
Class: infra_baselines::linux::redhat_insights<br>
OS Support: RedHat Linux<br>
No parameters<br>

### linux sshd
Configures some options on ssh server.<br>
Class: infra_baselines::linux::sshd<br>
OS Support: Linux<br>
Parameters (handled by Foreman):
- sshd_permitrootlogin: whether to permit root login or not.
- sshd_x11forwarding: X11 forwarding.
- sshd_usedns: use reverse dns lookups on client connect.

### linux sysctl_common
Make some sysctl tunning.<br>
Class: infra_baselines::linux::sysctl_common<br>
OS Support: Linux<br>
Parameters (handled by Foreman):
- sysctl_kernel_panic: time in seconds to reboot the system after a panic
- sysctl_panic_on_oom: whether to panic when the OOM Killer gets triggered

### linux sysctl
Provides a simple interface to manage many sysctl tunnings.<br>
Defined type: infra_baselines::linux::sysctl<br>
OS Support: Linux<br>
Parameters:
- sysctl_options: hash of sysctl options

### windows chocolatey
Installs chocolatey package manager.<br>
Class: infra_baselines::windows::chocolatey<br>
OS Support: Windows<br>
No parameters.<br>

### windows rdp
Ensure the terminal service is enabled<br>
Class: infra_baselines::windows::rdp<br>
OS Support: Windows<br>
No parameters.<br>

### windows winrm
Ensure the winrm is enabled<br>
Class: infra_baselines::windows::winrm<br>
OS Support: Windows<br>
No parameters.<br>

### check_linux
Class to test and fail in case it´s not a Linux system<br>
Class: infra_baselines::check_linux <br>
OS Support: Linux<br>

### check_windows
Class to test and fail in case it´s not a Windows system<br>
Class: infra_baselines::check_windows <br>
OS Support: Windows<br>

### params
Class to provide some default parameters values used by other classes.<br>
Class: infra_baselines::params<br>



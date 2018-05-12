# == Class: rbaselines::common::timezone
#
# Wrapper class to saz-timezone for Linux and tzutil for windows.
#
# === Parameters
#
# [*timezone*]
#   Use values from /usr/shaze/zoneinfo/* for linux
#   Use values from tzutil for windows
#
# === Examples
#
#  class { 'rbaselines::common::timezone':
#    manage_timezone => true,
#    timezone        => 'Etc/UTC',
#  }
#
# === Foreman:
# Use class parameters as follow (with the defaults above):
# - manage_timezone: boolean
# - timezone: Etc/UTC
#
# === Authors
#
# Andre Ramoni
#

class rbaselines::common::timezone (
  $manage_timezone = $::rbaselines::params::manage_timezone,
  $timezone        = $::rbaselines::params::timezone,
) inherits rbaselines::params {
  if $manage_timezone {
    case $::kernel {
      'Linux': {
        class { '::timezone':
          timezone => $timezone,
        }
      }
      'Windows': {
        if $timezone != $::tzutil {
          exec { 'settimezone':
            command => "tzutil /s \"${timezone}\" ",
            path    => 'C:/Windows/System32';
          }
        }
      }
      default: {
        fail("This class suports only windows and linux. Detected: ${::kernel}")
      }
    }
  }
}

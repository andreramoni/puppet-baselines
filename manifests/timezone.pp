# == Class: rbaselines::timezone
#
# Wrapper class to saz-timezone.
#
# === Parameters
#
# [*timezone*]
#   Use values from /usr/shaze/zoneinfo/*
#
# === Examples
#
#  class { 'rbaselines::timezone':
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

class rbaselines::timezone (
  $manage_timezone = $::rbaselines::params::manage_timezone,
  $timezone        = $::rbaselines::params::timezone,
) inherits rbaselines::params {
  if $manage_timezone {
    class { '::timezone':
      timezone => $timezone,
    }
  }
}

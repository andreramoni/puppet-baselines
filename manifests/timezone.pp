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
#    timezone => UTC,
#  }
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

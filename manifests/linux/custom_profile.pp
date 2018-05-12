# == Class: rbaselines::linux::custom_profile
#
# Custom profile.
#
# === Parameters
#
# [*custom_profile_file*]
# Where is the file.
#
# === Examples
#
#  class { 'rbaselines::custom_profile': }
#
# === Authors
#
# Andre Ramoni
#

class rbaselines::linux::custom_profile (
  $custom_profile_file = $::rbaselines::params::custom_profile_file,
) inherits rbaselines::params {
  file { $custom_profile_file:
    ensure  => file,
    mode    => '0755',
    content => template('rbaselines/profiles/custom_profile.erb'),
  }

}

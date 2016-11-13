# == Class: baselines::custom_profile
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
#  class { 'baselines::custom_profile': }
#
# === Authors
#
# Andre Ramoni
#

class baselines::custom_profile (
  $custom_profile_file = $::baselines::params::custom_profile_file,
) inherits baselines::params {
  file { $custom_profile_file:
    ensure  => file,
    mode    => '0755',
    content => template('baselines/profiles/custom_profile.erb'),

  }

}

# == Class: baselines::inputrc
#
# This class manipulates /etc/inputrc.
#
# === Variables
#
# [*inputrc_options*]
#   Hash of inputrc options to ensure.
#
# === Examples
#
#  class { 'trollme':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Andre Ramoni
#
class baselines::inputrc (
  $inputrc_options = $::baselines::params::inputrc_options,
) inherits baselines::params {
  augeas { 'inputrc':
    context => '/files/etc/inputrc',
    changes => $inputrc_options,
  }
}

# == Class: rbaselines::linux::inputrc
#
# This class manipulates /etc/inputrc.
#
# === Variables
#
# [*inputrc_options*]
#   Hash of inputrc options to ensure.
#
# === Authors
#
# Andre Ramoni
#
class rbaselines::linux::inputrc (
  $inputrc_options = $::rbaselines::params::inputrc_options,
) inherits rbaselines::params {
  augeas { 'inputrc':
    context => '/files/etc/inputrc',
    changes => $inputrc_options,
  }
}

# == Class: inputrc
#
# This class manipulates /etc/inputrc.
#
# === Parameters
#
# [*sample_parameter*]
#
#
# === Variables
#
# [*sample_variable*]
#
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
class baselines::inputrc {

  File_line {
    path  => '/etc/inputrc',
    multiple => true,
  }

  file_line { 'inputrc_showall':
    ensure => 'present',
    line   => 'set show-all-if-ambiguous on',
    match  => '^set show-all-if-ambiguous.*',
  }
  file_line { 'inputrc_completion':
    ensure => 'present',
    line   => 'set completion-ignore-case on',
    match  => '^set completion-ignore-case.*',
  }
}

# == Class: rbaselines
#
# Full description of class rbaselines here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class rbaselines {
  include rbaselines::hosts_localhost
  include rbaselines::inputrc
  include rbaselines::sysctl_common
  include rbaselines::vmwaretools
  include rbaselines::ssh_server
  include rbaselines::custom_profile
  include rbaselines::ntp
  include rbaselines::packages
  include rbaselines::scripts
  include rbaselines::redbutton
  include rbaselines::remove_package_proxy
  include rbaselines::timezone
  include rbaselines::sudoers
}

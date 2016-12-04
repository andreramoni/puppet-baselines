class rbaselines::sysctl_common (
  $sysctl_options        = $::rbaselines::params::sysctl_options,
) inherits rbaselines::params {
  rbaselines::sysctl { 'rbaselines':
    sysctl_options        => $sysctl_options,
  }
}

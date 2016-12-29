class rbaselines::swapfile (
  $swapfile = $::rbaselines::params::swapfile,
  $swapsize = $::rbaselines::params::swapsize,
) inherits rbaselines::params {
  swap_file::files { 'swapfile':
    ensure       => present,
    swapfile     => $swapfile,
    swapfilesize => $swapsize,
    add_mount    => true,
  }
}

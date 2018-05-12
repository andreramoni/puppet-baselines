# Class to fail when not windows
class rbaselines::check_windows {
  if ( $::osfamily != 'Windows' ){
    fail("${::osfamily} not supported. Windows is required.")
  }
  Package { provider => 'chocolatey' }
}

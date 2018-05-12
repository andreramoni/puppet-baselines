# Class to fail when not linux
class rbaselines::check_linux {
  if ( $::kernel != 'Linux' ){
    fail("${::kernel} not supported. Linux is required.")
  }
}

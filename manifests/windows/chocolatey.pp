class rbaselines::windows::chocolatey {
  require rbaselines::check_windows
  include chocolatey
}

# put this on site.pp:
#if ( $::kernel == 'Windows' ){
#  Package { provider => 'chocolatey' }
#}




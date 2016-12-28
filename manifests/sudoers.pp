class rbaselines::sudoers (
  $sudo_admins_file = $::rbaselines::params::sudo_admins_file,
  $sudo_groups = $::rbaselines::params::sudo_groups,
) inherits rbaselines::params {
  if $sudo_groups != [''] {
    file { $sudo_admins_file:
      ensure  => 'present',
      content => template('rbaselines/sudoers/admins.erb'),
    }
  }
  else {
    file { $sudo_admins_file:
      ensure  => 'absent',
    }
  }
}

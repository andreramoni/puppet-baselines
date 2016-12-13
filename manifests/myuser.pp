define baselines::myuser (
  $password,
  $ssh_keys,
  $user = $title,
  $ensure = $ensure,
  $shell = '/bin/bash',
  $managehome = true,
  $target_user = 'both',
  $gid = $title,
  $groups = '',

) {

  # The system user:
  user { $user:
    ensure     => $ensure,
    password   => $password,
    shell      => '/bin/bash',
    managehome => true,
    gid        => $gid,
    groups     => $groups,
  }

  # The ssh keys:
  $ssh_keys.keys.each |String $keyname| {
    # notify { "Array - ${keyname}: ${ssh_keys[$keyname]}":  }
    if ( $target_user == $user ) or ( $target_user == 'both' ){
      ssh_authorized_key { "sshkey-${user}-${keyname}":
        ensure => $ensure,
        type   => 'ssh-rsa',
        key    => $ssh_keys[$keyname],
        user   => $user,
      }
    }
    if ( $target_user == 'root' ) or ( $target_user == 'both' ){
      ssh_authorized_key { "sshkey-${user}-${keyname}-root":
        ensure => $ensure,
        type   => 'ssh-rsa',
        key    => $ssh_keys[$keyname],
        user   => 'root',
      }
    }
  }
}

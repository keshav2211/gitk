class gitk::config {

user { 'git':
  ensure           => 'present',
  managehome       => 'true',
  password         => '$6$3ToZK6Ea6$j9qhesMzwN7RQN780h78hVOsVqzhMfGYiGPG5YL8q6WYIe2oQwTim6Gu5j9Q89000ZB4fj1mDzZ3Qbs2FKbhn.',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
}

file { '/home/git/.ssh':
  ensure  => 'directory',
  group   => 'git',
  mode    => '0700',
  owner   => 'git',
}

file { '/home/git/.ssh/authorized_keys':
  ensure  => 'file',
  group   => 'git',
  mode    => '0600',
  owner   => 'git',
  source  => 'puppet:///modules/gitk/authorized_keys',
}

file { '/etc/git':
  ensure  => 'directory',
  group   => 'git',
  owner   => 'git',
}

}

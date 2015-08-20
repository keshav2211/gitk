class gitk {

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

package { 'git':
  ensure => 'present',
}

file { '/opt/git':
  ensure  => 'directory',
  group   => 'git',
  owner   => 'git',
}

exec { 'puppet-control-xt repo':
  command => 'git init --bare puppet-control-xt.git',
  cwd     => '/opt/git/',
  path    => '/usr/bin',
  user    => 'git',
  creates => '/opt/git/puppet-control-xt.git',
  require => Package['git'],
}

exec { 'gitk module repo':
  command => 'git init --bare gitk.git',
  cwd     => '/opt/git/',
  path    => '/usr/bin',
  user    => 'git',
  creates => '/opt/git/gitk.git',
  require => Package['git'],
}
}

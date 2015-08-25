define gitk::gitrepo {

file { '/opt/git':
  ensure  => 'directory',
  group   => 'git',
  owner   => 'git',
}

exec { "$title":
  command => "git init --bare ${title}.git",
  cwd     => '/opt/git/',
  path    => '/usr/bin',
  user    => 'git',
  creates => "/opt/git/${title}.git",
  require => Package['git'],
}

}


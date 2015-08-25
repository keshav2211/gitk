define gitk::gitrepo {

exec { "$title":
  command => "git init --bare ${title}.git",
  cwd     => '/etc/git/',
  path    => '/usr/bin',
  user    => 'git',
  creates => "/etc/git/${title}.git",
  require => Package['git'],
}

}


define gitk::gitrepo ($repohome='/opt/git') {

exec { "$title":
  command => "git init --bare ${title}.git",
  cwd     => "$repohome",
  path    => '/usr/bin',
  user    => 'git',
  creates => "${repohome}/${title}.git",
  require => [ Package['git'], File["$repohome"] ],
  }

}


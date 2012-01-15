class version_control::hub($bindir="/usr/local/bin") {
  exec { "install-hub":
    command => "curl http://defunkt.io/hub/standalone -sLo $bindir/hub",
    creates => "$bindir/hub",
  }

  file { "$bindir/hub":
    ensure => present,
    mode => 755,
    require => Exec["install-hub"],
  }
}

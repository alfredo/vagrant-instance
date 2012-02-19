class nginx() {
  package { "nginx":
    ensure => "installed",
  }
  file { "/etc/nginx/sites-available/default":
      source  => "puppet:///modules/nginx/vhost.nginx",
      owner   => "root",
      group   => "root",
      mode    => "644",
      require => Package["nginx"],
      notify  => Service["nginx"],
  }
  service { "nginx":
      ensure => "running",
      enable => true,
      hasrestart => true,
  }
}

class apache2 {

    $server_admin_email = $general::email
    $sites_available_path = "/etc/apache2/sites-available/proxy.conf"
    $sites_enabled_path = "/etc/apache2/sites-enabled/proxy.conf"

    $packages = ["apache2", "libapache2-mod-wsgi", "libapache2-mod-rpaf"]

    package { $packages: ensure => installed}

    service { "apache2":
        ensure => running,
        enable => true,
        hasrestart => true,
        require => [
                    Package["apache2"],
                    Package["libapache2-mod-wsgi"],
                    Package["libapache2-mod-rpaf"],
                   ],
    }

    exec { "reload-apache2":
         command => "/etc/init.d/apache2 reload",
         refreshonly => true,
         before => [ Service["apache2"], Exec["force-reload-apache2"] ]
    }

    exec { "force-reload-apache2":
         command => "/etc/init.d/apache2 force-reload",
	 refreshonly => true,
         before => Service["apache2"],
    }

    file {"/etc/apache2/apache2.conf":
        path => "/etc/apache2/apache2.conf",
        source => "puppet:///modules/apache2/apache2.conf",
        require => Package["apache2"],
        notify => Service["apache2"],
        owner => "root",
        group => "root",
    }

    file {"ports.conf":
        path => "/etc/apache2/ports.conf",
        source => "puppet:///modules/apache2/ports.conf",
        require => Package["apache2"],
        notify => Service["apache2"],
        owner => "root",
        group => "root",
    }

    file {$sites_available_path:
        content => template("apache2/project.conf.erb"),
        require => Package["apache2"],
        notify  => Service["apache2"],
        owner   => "root",
        group   => "root",
    }

    file {$sites_enabled_path:
        ensure  => link,
        target  => $sites_available_path,
        require => Package["apache2"],
        notify  => Service["apache2"],
        owner   => "root",
        group   => "root",
    }

    # make sure the default site isnt present.
    exec {"/usr/sbin/a2dissite default":
        onlyif => "/usr/bin/test -L /etc/apache2/sites-enabled/000-default",
        notify => Exec["reload-apache2"],
    }

    # make sure the default site isnt present.
    exec {"/usr/sbin/a2enmod proxy":
        notify => Exec["reload-apache2"],
    }

    # make sure the default site isnt present.
    exec {"/usr/sbin/a2enmod proxy_http":
        notify => Exec["reload-apache2"],
    }

    exec {"/usr/sbin/a2enmod headers":
        notify => Exec["reload-apache2"],
    }

    exec {"/usr/sbin/a2enmod expires":
        notify => Exec["reload-apache2"],
    }


}

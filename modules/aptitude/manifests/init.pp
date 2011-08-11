class aptitude {

    exec { "aptitude-update":
        command     => "/usr/bin/aptitude update",
        refreshonly => false;
    }

    cron { "aptitude-update":
        command => "/usr/bin/aptitude update",
        user    => root,
        hour    => 10,
        minute  => 0;
    }
}

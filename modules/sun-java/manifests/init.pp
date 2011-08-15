# From http://www.mogilowski.net/lang/en-us/2011/07/27/install-sun-java-with-puppet-on-ubuntu/


class sun-java {


include apt
apt::source { "partner":
    location => "http://archive.canonical.com/ubuntu",
    release => "${lsbdistcodename}",
    repos => "partner",
    include_src => false,
}


    file { "/var/cache/debconf/sun-java6.preseed":
        source => "puppet:///modules/sun-java/sun-java6.preseed",
        ensure => present
    }

    package { "sun-java6-jdk":
        ensure  => installed,
        responsefile => "/var/cache/debconf/sun-java6.preseed",
        require => [ Apt::Source["partner"], File["/var/cache/debconf/sun-java6.preseed"] ],
    }

}

class apache2 {
    $packages = ["apache2", "libapache2-mod-wsgi", "libapache2-mod-rpaf"]
    package { $packages: ensure => "purged"}
}

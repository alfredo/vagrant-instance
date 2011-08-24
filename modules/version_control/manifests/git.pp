class version_control::git {

    $git_name = $general::full_name
    $git_email = $general::email

    $packages = ["git-core", "git-svn"]
    package {
       $packages : ensure => installed;
    }

    file { "gitconfig":
        path => "/home/vagrant/.gitconfig",
        mode => 755,
        owner => vagrant,
        group => vagrant,
        ensure => file,
        content => template("version_control/gitconfig.erb"),
    }

}

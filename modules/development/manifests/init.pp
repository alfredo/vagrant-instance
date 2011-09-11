class development {

    file { "bashrc":
        path => "/home/vagrant/.bashrc",
        mode => 755,
        owner => vagrant,
        group => vagrant,
        ensure => file,
        content => template("development/home/bashrc.erb"),
    }

    file { "git-completion":
        path    => "/home/vagrant/.git-completion.bash",
        ensure  => present,
        owner   => vagrant,
        group   => adm,
        mode    => 644,
        source  => "puppet:///modules/development/home/git-completion.bash",
    }

    file { "inputrc":
        path    => "/home/vagrant/.inputrc",
        ensure  => present,
        owner   => vagrant,
        group   => adm,
        mode    => 644,
        source  => "puppet:///modules/development/home/inputrc",
    }

}

class version_control:gitflow($bindir="/usr/local/bin"){
  exec { "install-gitflow":
    refreshonly => true,
    command => "wget --no-check-certificate -q -O - https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh | sudo bash",
    }
 }



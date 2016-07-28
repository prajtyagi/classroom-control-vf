class nginx::params {

  case $::osfamily {

    'Debian': {
       'packagename' => 'nginx',
       'fileowner'   => 'root',
       'filegroup'   => 'root',
       'docroot'     => '/var/www',
       'configdir'   => '/etc/nginx',
       'serverbdir'  => '/etc/nginx/conf.d',
       'logsdir'     => '/var/log/nginx',
       'servicename' => 'nginx',
       'servicerunas'=> 'www-data',
      }
    'RedHat': {
        'packagename' => 'nginx',
       'fileowner'   => 'root',
       'filegroup'   => 'root',
       'docroot'     => '/var/www',
       'configdir'   => '/etc/nginx',
       'serverbdir'  => '/etc/nginx/conf.d',
       'logsdir'     => '/var/log/nginx',
       'servicename' => 'nginx',
       'servicerunas'=> 'nginx',
      }
    }
}

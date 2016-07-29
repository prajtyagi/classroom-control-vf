class nginx::params {
  case $::osfamily {
    'RedHat': {
      $port = 80
      $pkg = 'nginx'
      $etc_dir = '/etc/nginx'
      $fowner = 'root'
      $fgroup = 'root'
#      $docroot = '/var/www'
      $full_docroot = '/var/www'
      $server_block = "${etc_dir}/conf.d"
      $log_dir = '/var/log/nginx'
      $service = 'nginx'
      $run_as  = 'nginx'
    }
    'Debian': {
      $port = 80
      $pkg = 'nginx'
      $etc_dir = '/etc/nginx'
      $fowner = 'root'
      $fgroup = 'root'
#      $docroot = '/var/www'
      $full_docroot = '/var/www'
      $server_block = "${etc_dir}/conf.d"
      $log_dir = '/var/log/nginx'
      $service = 'nginx'
      $run_as  = 'www-data'
    }
    'windows': {
      $port = 80
      $pkg = 'nginx-service'
      $etc_dir = 'C:/ProgramData/nginx'
      $fowner = 'Administrator'
      $fgroup = 'Administrators'
#      $docroot = 'C:/ProgramData/nginx/html'
      $full_docroot = 'C:/ProgramData/nginx/html'
      $server_block = "${etc_dir}/conf.d"
      $log_dir = 'C:/ProgramData/gninx/logs'
      $service = 'nginx'
      $run_as  = 'nobody'
    }
    default: {
      fail("Operating system #{operatingsystem} is not supported.")
    }
  }
}

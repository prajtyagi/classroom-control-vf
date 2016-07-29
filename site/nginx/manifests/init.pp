class nginx (
  $root = undef,
  ) {

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
 
  $docroot = $root ? {
    undef => $full_docroot,
    default => $root,
  }
    
  File {
    owner => $fowner,
    group => $fgroup,
    mode  => '0644',
  }
  package { $pkg:
    ensure => present,
  }
  file { $docroot:
    ensure => directory,
  }
  file { "${docroot}/index.html":
    ensure => file,
    #source => 'puppet:///modules/nginx/index.html',
    content => template('nginx/index.html.erb'),
  }
  file { "${etc_dir}/nginx.conf":
    ensure  => file,
    #source  => 'puppet:///modules/nginx/nginx.conf',
    content => template('nginx/nginx.conf.erb'),
    require => Package[$pkg],
    notify  => Service[$service],
  }
  file { $server_block:
    ensure => directory,
  }
  file { "${server_block}/default.conf":
    ensure  => file,
    #source  => 'puppet:///modules/nginx/default.conf',
    content => template('nginx/default.conf.erb'),
    require => Package[$pkg],
    notify  => Service[$service],
  }
  service { $service:
    ensure    => running,
    enable    => true,
  }
}

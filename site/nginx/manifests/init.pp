class nginx (
      $port = $nginx::params::port,
      $pkg = $nginx::params::pkg,
      $etc_dir = $nginx::params::etc_dir,
      $fowner = $nginx::params::fowner,
      $fgroup = $nginx::params::fgroup,
      $docroot = $nginx::params::docroot,
      $full_docroot = $nginx::params::full_docroot,
      $server_block = $nginx::params::server_block,
      $log_dir = $nginx::params::log_dir,
      $service = $nginx::params::service,
      $run_as  = $nginx::params::run_as,
      )
      inherits nginx::params {
      
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
    source => 'puppet:///modules/nginx/index.html',
    #content => template('nginx/index.html.erb'),
  }
  file { "${etc_dir}/nginx.conf":
    ensure  => file,
    source  => 'puppet:///modules/nginx/nginx.conf',
    #content => template('nginx/nginx.conf.erb'),
    require => Package[$pkg],
    notify  => Service[$service],
  }
  file { $server_block:
    ensure => directory,
  }
  file { "${server_block}/default.conf":
    ensure  => file,
    source  => 'puppet:///modules/nginx/default.conf',
    #content => template('nginx/default.conf.erb'),
    require => Package[$pkg],
    notify  => Service[$service],
  }
  service { $service:
    ensure    => running,
    enable    => true,
  }
}

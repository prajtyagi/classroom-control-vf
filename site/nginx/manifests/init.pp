class nginx (
  $root = undef,
  ) {

  
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

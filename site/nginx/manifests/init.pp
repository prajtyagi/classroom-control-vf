class nginx {
  $nginx_dir = '/etc/nginx/'
  
  package { 'nginx':
    ensure => present,
    }
    
  file { "${nginx_dir}/nginx.conf":
    ensure => file,
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    }
  
  file { "${nginx_dir}/conf.d/default.conf":
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    }
  
  file {'/var/www':
    ensure => directory,
    }
    
  file { '/var/www/index.html':
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
    require => Package['nginx'],
    }
    
  service {'nginx':
    ensure => running,
    enable => true,
    subscribe => File["${nginx_dir}/nginx.conf"]
  }
}

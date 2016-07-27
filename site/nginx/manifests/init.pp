class nginx {
  package { 'nginx':
    ensure => present,
    }
    
  file { '/etc/nginx/nginx.conf':
    ensure => present,
    source => puppet:///modules/nginx/nginx.conf
    require => Package['nginx'],
    }
  
  service {'nginx':
    ensure => running,
    enable => true,
    subscribe => File['/etc/sysconfig/nginx.conf']
  }
}

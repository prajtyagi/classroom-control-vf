class nginx {
  package { 'nginx':
    ensure => present,
    }
    
  file { '/etc/nginx/nginx.conf':
    ensure => present,
    source => puppet:
    require => Package['nginx'],
    }
  
  service {'memcached':
    ensure => running,
    enable => true,
    subscribe => File['/etc/sysconfig/memcached']
  }
}

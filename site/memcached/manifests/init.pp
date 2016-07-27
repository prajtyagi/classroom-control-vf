class memchached {
  package { 'memcached':
    ensure => present,
    }
    
  file { '/etc/sysconfig/memcached':
    ensure => present,
    require => Package['memcached'],
    }
  
  service {'memcached':
    ensure => running,
    enable => true,
    subscribe => File['/etc/sysconfig/memcached']
  }
}
    
    

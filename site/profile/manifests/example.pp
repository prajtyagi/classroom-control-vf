class profile::example {
  include apache
  include wordpress
  class { '::mysql::server':
  root_password           => 'strongpassword',
}
 class { 'mysql::bindings':
        php_enable => true,
  }
  
  notify { 'This is the example profile!': }
}

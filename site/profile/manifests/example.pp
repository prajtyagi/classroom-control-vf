class profile::example {
  include apache
  
  include apache::mod::php

class { 'wordpress':
    install_dir => '/var/www/html',
  }
  
  class { '::mysql::server':
  root_password           => 'strongpassword',
}

 class { 'mysql::bindings':
        php_enable => true,
  }
  notify { 'This is the example profile!': }
}

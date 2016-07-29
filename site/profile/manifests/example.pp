class profile::example {
  include apache
  include wordpress
  class { '::mysql::server':
  root_password           => 'strongpassword',
}
  
  notify { 'This is the example profile!': }
}

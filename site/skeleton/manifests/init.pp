class skeleton {

  file { '/etc/skel':
    ensure => 'directory',
  }

  file { '/etc/skel/.bashrc':
   ensure  => file,
   owner   => 'root',
   group   => 'root',
   mode    => '0644',
   source  => 'site/skeleton/files/.bashrc',
   }
}

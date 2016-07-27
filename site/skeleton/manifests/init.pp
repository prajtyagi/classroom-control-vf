file { '/etc/skel/.bashrc':
   ensure  => file,
   owner   => 'root',
   group   => 'root',
   mode    => '0644',
   sources  => 'puppet:///site/skeleton/files/bashrc',
 }

class users::admins {
  users::managed_user { 'jose': group => admin,}
  users::managed_user { 'alice': }
  users::managed_user { 'chen' :
      group => admin,
   }
  group { 'admin':
    ensure => present,
  }
}

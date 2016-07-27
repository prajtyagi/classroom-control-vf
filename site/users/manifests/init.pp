#this is init.pp file
class users {
  user { 'fundamentals':
    ensure => present,
  }
}

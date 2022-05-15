# Example base services profile
class profile::base::services {
  service { 'NetworkManager':
    ensure => 'stopped',
    enable => false,
  }
}

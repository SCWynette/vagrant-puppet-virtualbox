# Example base ntp profile
class profile::base::ntp (
  $servers,
) {
  class { '::ntp':
    servers => $servers,
  }
}

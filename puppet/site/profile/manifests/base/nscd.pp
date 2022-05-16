# Example base nscd profile
class profile::base::nscd {
  class { '::nscd':
    pkg_ensure     => 'present',
    service_ensure => true,
    service_enable => true,
    dbconfig       => {
        'hosts'    => {
          'enable-cache' => false,
        },
        'netgroup' => {
          'enable-cache' => false,
      }
    }
  }
}

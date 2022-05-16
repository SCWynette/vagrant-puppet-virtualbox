# Example base nis profile
class profile::base::nis {
  include ::portmap

  class { '::yp':
    domain => 'example.com',
  }

  class { '::yp::bind':
    domain  => 'example.com',
    servers => ['192.0.2.1', '192.0.2.2', '192.0.2.3'],
  }

  Class['::portmap'] ~> Class['::yp::bind'] <~ Class['::yp']
}

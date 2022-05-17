# Example base nis profile
class profile::base::nis (
  $domain,
  $servers,
) {
  include ::portmap

  class { '::yp':
    domain => $domain,
  }

  class { '::yp::bind':
    domain  => $domain,
    servers => $servers,
  }

  Class['::portmap'] ~> Class['::yp::bind'] <~ Class['::yp']
}

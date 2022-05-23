# Example base dns profile
class profile::base::dns (
  $nameservers,
  $searchpath,
) {
  class { '::resolv_conf':
    nameservers => $nameservers,
    searchpath  => $searchpath,
  }
}

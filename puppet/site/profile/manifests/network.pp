# Puppet network profile
class profile::network (
  $ipaddress
) {
  include ::network

  network_config { 'eth1':
    ensure    => 'present',
    family    => 'inet',
    ipaddress => $ipaddress,
    method    => 'static',
    netmask   => '255.255.255.0',
    onboot    => 'true',
  }
}

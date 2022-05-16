# Example base nsswitch profile
class profile::base::nsswitch (
  $passwd,
  $shadow,
  $group,
  $automount,
) {
  class { '::nsswitch':
    passwd     => $passwd,
    shadow     => $shadow,
    group      => $group,
    hosts      => ['files','nis'],
    bootparams => 'files',
    ethers     => 'files',
    netmasks   => 'files',
    networks   => 'files',
    protocols  => 'files',
    rpc        => 'files',
    services   => 'files',
    netgroup   => ['files','nis'],
    publickey  => 'files',
    automount  => $automount,
    aliases    => ['files','nis'],
    require    => Class['::yp::bind'],
  }
}

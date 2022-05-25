# Example base autofs profile
class profile::base::autofs (
  $nfs_trusted,
  $auto_master_map,
) {
  if ($nfs_trusted) {
    class { '::autofs':
      manage_service_config   => true,
      service_use_misc_device => 'yes',
      service_options         => ['DNFS_OPTS=tcp','intr','actimeo=3','vers=3'],
    }

    autofs::map { '/etc/auto.master':
      mapcontents => $auto_master_map,
      replace     => false
    }
  }
}

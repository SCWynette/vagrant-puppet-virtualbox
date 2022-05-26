# Example base autofs profile
class profile::base::autofs (
  $auto_master_map,
  $manage_service_config,
  $nfs_trusted,
  $service_options,
  $service_use_misc_device,
) {
  if $nfs_trusted {
    class { '::example_autofs':
      auto_master_map         => $auto_master_map,
      manage_service_config   => $manage_service_config,
      service_options         => $service_options,
      service_use_misc_device => $service_use_misc_device,
    }
  } else {
    echo { 'Skipping profile::base::autofs as node is not trusted by nfs':
      withpath => false
    }
  }
}

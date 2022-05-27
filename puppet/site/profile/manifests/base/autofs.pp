# Example base autofs profile
class profile::base::autofs (
  $auto_master_map,
  $nfs_trusted,
) {
  if ($nfs_trusted == 'true') {
    class { '::example_autofs':
      auto_master_map         => $auto_master_map,
      manage_service_config   => $manage_service_config,
      service_options         => $service_options,
      service_use_misc_device => $service_use_misc_device,
    }

    class { '::example_nsswitch':
      automount => ['files','nis'],
    }
  } else {
    echo { 'Skipping profile::base::autofs as node is not trusted by nfs':
      withpath => false
    }
  }
}

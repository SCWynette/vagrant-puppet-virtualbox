# example_autofs class
class example_autofs (
  $auto_master_map,
  $manage_service_config,
  $service_options,
  $service_conf_path,
  $service_use_misc_device,
) {
  include autofs

  autofs::map { '/etc/auto.master':
    mapcontents => "+${auto_master_map}",
  }

  if $manage_service_config {
    if $service_conf_path {
      file { $service_conf_path:
        ensure  => 'file',
        content => epp(
          'example_autofs/service_conf.epp',
          {
            service_options         => $service_options,
            service_use_misc_device => $service_use_misc_device,
          }
        ),
        group   => 'root',
        mode    => '0600',
        owner   => 'root',
        notify  => Service[autofs],
      }
    }
  }
}

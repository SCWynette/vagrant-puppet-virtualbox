# example_daemontools class
class example_daemontools (
  $apply,
  $binaries,
  $man_page,
) {
  if($apply) {
    $binaries.each |$key,$value| {
      file { $key:
        *      => $value,
        ensure => 'file',
        mode   => '0555',
        owner  => 'root',
        group  => 'root',
      }
    }

    $man_page.each |$key,$value| {
      file { $key:
        *      => $value,
        ensure => 'file',
        mode   => '0444',
        owner  => 'root',
        group  => 'root',
      }
    }
  } else {
    echo { 'Skipping example_daemontools due to unsupported os':
      withpath => false
    }
  }
}

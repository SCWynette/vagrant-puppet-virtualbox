# example_daemontools class
class example_daemontools (
  $binaries,
  $man_page,
  $supported,
) {
  if($supported) {
    $binaries.each |$key,$value| {
      file { $key:
        *     => $value,
        mode  => '0555',
        owner => 'root',
        group => 'root',
      }
    }

    $man_page.each |$key,$value| {
      file { $key:
        *     => $value,
        mode  => '0444',
        owner => 'root',
        group => 'root',
      }
    }
  } else {
    echo { 'skipping example_daemontools due to unsupported os':
      withpath => false
    }
  }
}

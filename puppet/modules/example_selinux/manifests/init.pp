# example_selinux class
class example_selinux (
  $apply,
  $options_hash,
) {
  if($apply) {
    class { 'selinux':
      * => $options_hash
    }
  } else {
    echo { 'Skipping example_selinux due to unsupported os':
      withpath => false
    }
  }
}

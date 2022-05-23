# example_selinux class
class example_selinux (
  $supported,
  $options_hash,
) {
  if($supported == 'true') {
    class { 'selinux':
      * => $options_hash
    }
  } else {
    echo { 'skipping example_selinux due to unsupported os':
      withpath => false
    }
  }
}

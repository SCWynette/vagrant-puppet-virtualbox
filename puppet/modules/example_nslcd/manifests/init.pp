# example_nslcd class
class example_nslcd (
  $options_hash
) {
  class { '::nslcd':
    * => $options_hash,
  }
}

# example_nsswitch class
class example_nsswitch (
  $options_hash,
  $automount,
) {
  class { '::nsswitch':
    *         => $options_hash,
    automount => $automount,
    require   => Class['::yp::bind'],
  }
}

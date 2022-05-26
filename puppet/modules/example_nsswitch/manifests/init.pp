# example_nsswitch class
class example_nsswitch (
  $automount,
  $options,
) {
  class { '::nsswitch':
    *         => $options,
    automount => $automount,
    require   => Class['::yp::bind'],
  }
}

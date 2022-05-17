# Example base nsswitch profile
class profile::base::nsswitch (
  $automount,
) {
  class { '::example_nsswitch':
    automount => $automount,
  }
}

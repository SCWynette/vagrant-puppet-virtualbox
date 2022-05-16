# example_common class
class example_common (
  $latest_packages,
) {
    class { '::packages::manage':
      latest_packages => $latest_packages,
  }
}

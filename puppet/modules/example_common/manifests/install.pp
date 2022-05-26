# # example_common::install class that inherits lookups
class example_common::install inherits example_common {
  class { '::packages::manage':
    latest_packages  => $example_common::latest_packages,
    install_packages => $example_common::install_packages,
    remove_packages  => $example_common::remove_packages,
    install_version  => $example_common::install_version,
  }
}

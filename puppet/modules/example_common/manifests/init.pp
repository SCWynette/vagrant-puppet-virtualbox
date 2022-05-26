# example_common class
class example_common (
  $files,
  $install_packages,
  $install_version,
  $latest_packages,
  $remove_packages,
  $services,
  $users,
) {
  include example_common::install
  include example_common::config
  include example_common::service
}

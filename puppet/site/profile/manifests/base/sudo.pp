# Example base sudo profile
class profile::base::sudo {
  class { 'sudo':
    purge               => false,
    config_file_replace => false,
  }
}

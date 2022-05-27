# Example base nsswitch profile
class profile::base::nsswitch (
  $nfs_trusted,
) {
  if ($nfs_trusted != 'true') {
    class { '::example_nsswitch':
      automount => 'files',
    }
  }
}

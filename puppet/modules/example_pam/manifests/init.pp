# example_pam class
class example_pam (
  $options_hash,
) {
  class { '::pam':
    *       => $options_hash,
    require => Class['::yp::bind'],
  }
}

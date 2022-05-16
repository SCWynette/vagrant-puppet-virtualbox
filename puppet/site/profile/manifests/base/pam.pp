# Example base pam profile
class profile::base::pam (
  $manage_nsswitch,
  $pam_account_lines,
  $pam_account_lines,
  $pam_account_lines,
  $pam_account_lines,
) {
  class { '::pam':
    manage_nsswitch         => $manage_nsswitch,
    pam_account_lines       => $pam_account_lines,
    pam_password_lines      => $pam_account_lines,
    pam_session_lines       => $pam_account_lines,
    pam_password_auth_lines => $pam_account_lines,
    require                 => Class['::yp::bind'],
  }
}

# example_pam class
class example_pam (
  $manage_nsswitch,
  $pam_account_lines,
  $pam_auth_lines,
  $pam_password_auth_lines,
  $pam_password_lines,
  $pam_session_lines,
  $pam_auth_files,
) {
  class { '::pam':
    manage_nsswitch         => $manage_nsswitch,
    pam_account_lines       => $pam_account_lines,
    pam_auth_lines          => $pam_auth_lines,
    pam_password_auth_lines => $pam_password_auth_lines,
    pam_password_lines      => $pam_password_lines,
    pam_session_lines       => $pam_session_lines,
    require                 => Class['::yp::bind'],
  }

  $pam_auth_files.each |$key,$value| {
    file { $key:
      * => $value,
    }
  }
}

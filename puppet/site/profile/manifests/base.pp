# Puppet base profile
class profile::base {
  # include profile::base::autofs
  include profile::base::daemontools
  # include profile::base::dns
  include profile::base::logrotate
  # include profile::base::nis
  include profile::base::nscd
  include profile::base::nslcd
  # include profile::base::nsswitch
  include profile::base::ntp
  include profile::base::packages
  # include profile::base::pam
  include profile::base::selinux
  include profile::base::sudo
}

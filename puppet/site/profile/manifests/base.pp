# Puppet base profile
class profile::base {
  include profile::base::daemontools
  include profile::base::dns
  include profile::base::logrotate
  include profile::base::nscd
  include profile::base::ntp
  include profile::base::packages
  include profile::base::selinux
  include profile::base::services
  include profile::base::sudo
  include profile::base::nslcd
  include profile::base::autofs
}

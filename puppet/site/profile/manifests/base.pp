# Puppet base profile
class profile::base {
    include profile::base::dns
    include profile::base::ntp
    include profile::base::packages
    include profile::base::services
    include profile::base::sudo
}

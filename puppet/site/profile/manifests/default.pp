# Puppet example profile
class profile::default {
  echo { 'You are using the default profile':
    withpath => false
  }
}

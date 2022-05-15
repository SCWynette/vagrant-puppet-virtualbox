# Puppet example profile
class profile::default {
  echo { 'Test Message':
    withpath => false
  }
}

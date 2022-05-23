# Example base logrotate profile
class profile::base::logrotate (
  $conf,
  $rule,
) {
  $conf.each |$key,$value| {
    logrotate::conf { $key:
      * => $value,
    }
  }

  $rule.each |$key,$value| {
    logrotate::rule { $key:
      * => $value,
    }
  }
}

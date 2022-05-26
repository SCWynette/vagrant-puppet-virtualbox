# # example_common::config class that inherits lookups
class example_common::config inherits example_common {
  $example_common::files.each |$key,$value| {
    file { $key:
      *      => $value,
      ensure => 'file',
    }
  }

  $example_common::users.each |$key,$value| {
    user { $key:
      *      => $value,
    }
  }
}

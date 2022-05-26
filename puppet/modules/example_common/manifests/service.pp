# # example_common::service class that inherits lookups
class example_common::service inherits example_common {
  $example_common::services.each |$key,$value| {
    service { $key:
      *      => $value,
    }
  }
}

import 'package:build/build.dart';
import 'package:carbonic_local_storage_generator/src/generator.dart';
import 'package:source_gen/source_gen.dart';

/// Configuration for using `package:build`-compatible build systems.
///
/// See:
/// * [build_runner](https://pub.dev/packages/build_runner)
///
/// This library is **not** intended to be imported by typical end-users.
Builder storages(BuilderOptions options) {
  return SharedPartBuilder([const LocalStorageGenerator()], 'storages');
}

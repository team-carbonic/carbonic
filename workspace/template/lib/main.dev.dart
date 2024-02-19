import 'package:sotwo/core/config/flavor.dart';
import 'package:sotwo/main.dart' as runner;

void main() {
  F.flavor = Flavor.dev;
  runner.main();
}

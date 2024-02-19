// dart run pigeon --input etc/pigeon/security_keypad.dart

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/core/ui/security_keypad/api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/app/src/main/kotlin/com/sablue/sotwo/security_keypad/Api.g.kt',
    kotlinOptions: KotlinOptions(),
    swiftOut: 'ios/Runner/Core/SecurityKeypad/Api.g.swift',
    swiftOptions: SwiftOptions(),
  ),
)
@HostApi()
abstract class SecurityKeypadHostApi {
  // Android에서만 사용
  void hide();
}

@FlutterApi()
abstract class SecurityKeypadFlutterApi {
  void onHostFocusLost();
  void onInputLengthChanged(final int length);
  void onInputCompleted(final String? encryptedInput);
}

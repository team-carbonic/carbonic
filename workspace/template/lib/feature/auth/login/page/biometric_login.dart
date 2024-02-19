import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sotwo/core/utility/device_information.dart';
import 'package:sotwo/feature/auth/core/core/provider/user.dart';
import 'package:sotwo/feature/auth/core/core/provider/user_setting.dart';
import 'package:sotwo/feature/auth/login/page/biometric_template.dart';

class BiometricLoginPage extends ConsumerStatefulWidget {
  const BiometricLoginPage({super.key});

  @override
  ConsumerState<BiometricLoginPage> createState() => _BiometricLoginPageState();
}

class _BiometricLoginPageState extends ConsumerState<BiometricLoginPage> {
  @override
  void initState() {
    super.initState();

    final id = ref.read(userProvider)?.id;
    if (id == null) {
      // TODO : 어디로 보낼 것인가
      return;
    }

    final userSetting = ref.read(userSettingProvider(id));
    if (userSetting == null) {
      // TODO : 어디로 보낼 것인가
      return;
    }

    final auth = LocalAuthentication();

    final useBiometricLogin = userSetting.useBiometricLogin;
    final needRequestBiometricLogin = useBiometricLogin == null;
    if (needRequestBiometricLogin) {
      final platform = GetIt.I.get<DeviceInformation>().platform;
      switch (platform) {
        case PlatformType.android:
          break;
        case PlatformType.ios:
          break;
      }
    }

    auth
        .authenticate(
      localizedReason: '생체인증',
      options: const AuthenticationOptions(biometricOnly: true),
    )
        .then((succeeded) {
      if (succeeded) {
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return const BiometricTemplate();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sotwo/core/ui/bottom_sheet.dart';
import 'package:sotwo/core/utility/call_wrapper.dart';
import 'package:sotwo/core/utility/device_information.dart';
import 'package:sotwo/feature/auth/login/biometric_manager.dart';
import 'package:sotwo/feature/auth/login/page/biometric_template.dart';
import 'package:sotwo/feature/route/route.dart';

class InitialBiometricRegisterPage extends ConsumerStatefulWidget {
  const InitialBiometricRegisterPage({super.key});

  @override
  ConsumerState<InitialBiometricRegisterPage> createState() =>
      _InitialBiometricRegisterPageState();
}

class _InitialBiometricRegisterPageState
    extends ConsumerState<InitialBiometricRegisterPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final platform = GetIt.I.get<DeviceInformation>().platform;
      if (platform == PlatformType.android) {
        _showAndroidInquireBottomSheet();
      } else {
        _authenticate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const BiometricTemplate();
  }

  void _showAndroidInquireBottomSheet() {
    SabBottomSheet.showTwoButtons(
      context,
      title: "'SOTWO'에서 생체인증을\n사용하도록 허용하시겠습니까?",
      mainButtonText: '허용',
      subButtonText: '허용 안 함',
      onMainButtonPressed: () => Throttler.processSync(
        hashCode,
        () {
          context.pop();
          _authenticate();
        },
      ),
      onSubButtonPressed: () => Throttler.processSync(
        hashCode,
        _goHome,
      ),
    );
  }

  Future<void> _authenticate() async {
    final succeeded = await BiometricManager.authenticate();
    if (!context.mounted) {
      return;
    }

    if (succeeded) {
      _goHome();
    } else {
      BiometricManager.showRegistrationFailBottomSheet(
        context,
        onPressed: () => Throttler.processSync(
          hashCode,
          _goHome,
        ),
      );
    }
  }

  void _goHome() {
    SabRoute.home.go(context);
  }
}

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sotwo/core/ui/bottom_sheet.dart';
import 'package:sotwo/core/utility/logger/logger.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class BiometricManager {
  const BiometricManager._();

  static Future<bool> isBiometricAvailable() async {
    try {
      final auth = LocalAuthentication();
      return auth.canCheckBiometrics;
      // * android API 29 이하에서 동작 안함
      // return (await auth.getAvailableBiometrics()).isNotEmpty;
    } catch (e, s) {
      Logger.error(
        content: 'Failed to check biometric availability',
        title: 'BiometricLoginManager',
        exception: e,
        stackTrace: s,
      );
      return false;
    }
  }

  // TODO : 등록과 로그인을 구분하여 문구 처리
  static Future<bool> authenticate() async {
    try {
      final auth = LocalAuthentication();
      return await auth.authenticate(
        localizedReason: '생체인증',
        authMessages: [
          const AndroidAuthMessages(
            signInTitle: '생체인증',
            cancelButton: '취소',
            goToSettingsButton: '설정으로 이동',
            goToSettingsDescription: '설정으로 이동하여 생체인증을 설정해주세요',
            biometricHint: '생체인증을 진행해주세요',
            biometricNotRecognized: '생체인증이 일치하지 않습니다',
            biometricSuccess: '생체인증 성공',
            biometricRequiredTitle: '생체인증 필요',
            deviceCredentialsRequiredTitle: '생체인증 미설정',
            deviceCredentialsSetupDescription: '설정으로 이동하여 생체인증을 설정해주세요',
          ),
          const IOSAuthMessages(
            goToSettingsButton: '설정으로 이동',
            goToSettingsDescription: '설정으로 이동하여 생체인증을 설정해주세요',
            cancelButton: '취소',
            localizedFallbackTitle: '비밀번호로 로그인',
            lockOut: '생체인증이 잠겼습니다',
          ),
        ],
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e, s) {
      Logger.error(
        content: 'Failed to authenticate with biometric',
        title: 'BiometricLoginManager',
        exception: e,
        stackTrace: s,
      );
      return false;
    }
  }

  static void showRegistrationSuccessBottomSheet(
    final BuildContext context, {
    required final VoidCallback onPressed,
  }) {
    SabBottomSheet.showOneButton(
      context,
      title: '생체인증 등록에\n성공했습니다',
      buttonText: '확인',
      onPressed: onPressed,
    );
  }

  static void showRegistrationFailBottomSheet(
    final BuildContext context, {
    required final VoidCallback onPressed,
  }) {
    SabBottomSheet.showOneButton(
      context,
      title: '생체인증 등록에\n실패했습니다',
      buttonText: '확인',
      onPressed: onPressed,
    );
  }
}

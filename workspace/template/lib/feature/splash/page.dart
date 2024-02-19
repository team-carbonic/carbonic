import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sotwo/core/network/custom_response.dart';
import 'package:sotwo/feature/auth/core/core/provider/device_sab_id.dart';
import 'package:sotwo/feature/auth/core/core/provider/user.dart';
import 'package:sotwo/feature/auth/core/core/provider/user_setting.dart';
import 'package:sotwo/feature/auth/login/biometric_manager.dart';
import 'package:sotwo/feature/route/deeplink/handler.dart';
import 'package:sotwo/feature/route/route.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({super.key});

  @override
  ConsumerState<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends ConsumerState<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late final Completer _animationCompleter;
  late final AnimationController _animationController;
  static const _splashAnimationDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _animationCompleter = Completer();

    _animationController = AnimationController(
      vsync: this,
      duration: _splashAnimationDuration,
    )..forward().whenCompleteOrCancel(
        () {
          // 최소한 애니메이션은 완료해야 다음 페이지로 이동 가능하다.
          _animationCompleter.complete();
        },
      );

    _initialize();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 하단 시스템 영역 불포함
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: Image.asset(
                  'asset/feature/splash/SOTWO_V2_5_splash.png',
                ),
              ),
            ),
          ),
          // 하단 시스템 영역 포함 정중앙
          SizedBox(
            width: double.infinity,
            child: Lottie.asset(
              'asset/feature/splash/SOTWO_V2_5_splash.json',
              repeat: false,
              controller: _animationController,
            ),
          ),
        ],
      ),
    );
  }

  void _initialize() async {
    // 여러 초기화 로직 실행
    SabRoute? initialRoute;

    // TODO: 딥링크로 들어온 경우
    // TODO: 로그인 프로세스 반영 필요
    final initialUri = DeeplinkHandler.useInitialUri();
    if (initialUri != null) {
      initialRoute = SabRoute.fromDeepLinkKey(initialUri.path);
    }

    if (initialRoute == null) {
      // TODO: token 존재 여부 판단
      // TODO: token이 있을 경우 로그인 프로세스 진행
      // TODO: token이 없을 경우 본인인증 플로우 시작
      final deviceSabId = await ref.read(deviceSabIdProvider.future);
      if (deviceSabId?.isNewDevice ?? true) {
        initialRoute = SabRoute.initialVisitOnboarding;
      } else {
        initialRoute = SabRoute.revisitOnboarding;
      }
    }

    // TODO : 로그인 프로세스로 이전 필요
    final id = ref.read(userProvider)?.id;
    if (id != null) {
      final available = await BiometricManager.isBiometricAvailable();
      if (available) {
        initialRoute = SabRoute.initialBiometricRegister;
      } else {
        initialRoute = SabRoute.home;
      }
    }

    _go(initialRoute);
  }

  void _go(final SabRoute route) async {
    await _animationCompleter.future;
    if (!context.mounted) {
      // TODO: root context를 사용해서라도 보내야 함
      return;
    }
    route.go(context);
  }
}

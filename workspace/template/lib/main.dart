import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sotwo/core/appsflyer/manager.dart';
import 'package:sotwo/core/config/flavor.dart';
import 'package:sotwo/core/firebase/manager.dart';
import 'package:sotwo/core/push_notification/manager.dart';
import 'package:sotwo/core/sentry/wrapper.dart';
import 'package:sotwo/core/theme/scroll.dart';
import 'package:sotwo/core/theme/theme.dart';
import 'package:sotwo/core/utility/device_information.dart';
import 'package:sotwo/core/utility/local_storage/manager.dart';
import 'package:sotwo/core/utility/logger/logger.dart';
import 'package:sotwo/core/utility/permission/manager.dart';
import 'package:sotwo/feature/route/deeplink/handler.dart';
import 'package:sotwo/feature/route/router.dart';
import 'package:sotwo/core/security/program.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      );

      // TODO : 추후 debug 모드일 때는 sentry를 사용하지 않도록 변경 고려
      await SentryFlutter.init(
        (options) {
          options.dsn = F.flavor.sentryDsn;
          options.tracesSampleRate = F.flavor.sentryTracesSampleRate;
          options.environment = F.flavor.name;
        },
      );

      // 현재로서는 [Logger.error]에만 handler를 부착하여 sentry의 비용을 최소화하는 전략을 사용한다.
      Logger.setExtraHandlers(
        errorHandler: SentryWrapper.captureException,
      );

      // * 여러 초기화 구문은 아래에 추가할 것
      await AppInitializer.initialize();

      // TODO : AppInitializer에 묶기
      DeeplinkHandler.initialize();
      await AppsflyerManager.initialize();
      await FirebaseManager.initialize();
      await LocalNotificationManager.initialize();

      if (SecurityProgram.needSecurityProgram) {
        SecurityProgram().initialize();
      }

      await PermissionManager.requestNotificationPermission();

      // sentry가 아닌 custom zone에서 app을 실행한다.
      runApp(
        const ProviderScope(
          child: App(),
        ),
      );
    },
    (exception, stackTrace) {
      Logger.error(
        title: 'Uncaught Exception',
        exception: exception,
        stackTrace: stackTrace,
      );
    },
  );
}

class AppInitializer {
  const AppInitializer._();

  static Future<void> initialize() async {
    await LocalStorageManager.initialize();

    await GetIt.I.registerSingleton(DeviceInformation()).initialize();
  }
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    return AppLifeCycleHandlerWidget(
      child: GlobalLoaderOverlay(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: F.flavor.appName,
          locale: const Locale('ko', 'KR'),
          theme: SabTheme.getLightTheme(context),
          routerConfig: router,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.noScaling,
              ),
              child: DefaultTextHeightBehavior(
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
                child: ScrollConfiguration(
                  behavior: SabScrollBehavior(),
                  child: child!,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppLifeCycleHandlerWidget extends StatefulWidget {
  final Widget child;
  const AppLifeCycleHandlerWidget({super.key, required this.child});

  @override
  State<AppLifeCycleHandlerWidget> createState() =>
      _AppLifeCycleHandlerWidgetState();
}

class _AppLifeCycleHandlerWidgetState extends State<AppLifeCycleHandlerWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: sentry 자체에서 ui.lifecycle을 기록하기 때문에 필요하지 않을 수 있으나, flutter의 lifecycle과 완전히 매칭이 되지 않기 때문에, 결정이 필요함. (Android만 확인)
    SentryWrapper.addBreadcrumb(
      message: 'App LifeCycle Changed : $state',
    );

    switch (state) {
      case AppLifecycleState.resumed:
        _onResumed();
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        _onDeactivated();
    }
  }

  void _onResumed() {
    if (SecurityProgram.needSecurityProgram) {
      SecurityProgram().onResumed();
    }
  }

  void _onDeactivated() {}

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

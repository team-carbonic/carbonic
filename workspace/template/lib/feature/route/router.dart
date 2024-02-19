import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sotwo/core/utility/cast.dart';
import 'package:sotwo/feature/auth/core/form/page.dart';
import 'package:sotwo/feature/announcement/ui/page/detail.dart';
import 'package:sotwo/feature/announcement/ui/page/list.dart';
import 'package:sotwo/feature/auth/core/page/mobile_carrier.dart';
import 'package:sotwo/feature/auth/core/page/terms.dart';
import 'package:sotwo/feature/auth/core/page/terms_detail.dart';
import 'package:sotwo/feature/auth/login/page/biometric_login.dart';
import 'package:sotwo/feature/auth/login/page/biometric_register.dart';
import 'package:sotwo/feature/auth/login/page/initial_biometric_register.dart';
import 'package:sotwo/feature/etc/open_source_license/page.dart';
import 'package:sotwo/feature/event/ui/page/detail.dart';
import 'package:sotwo/feature/event/ui/page/list.dart';
import 'package:sotwo/feature/main/shell_page.dart';
import 'package:sotwo/feature/menu/page.dart';
import 'package:sotwo/feature/my/page.dart';
import 'package:sotwo/feature/onboarding/initial_visit_page.dart';
import 'package:sotwo/feature/onboarding/revisit_page.dart';
import 'package:sotwo/feature/route/adapter/bottom_sheet.dart';
import 'package:sotwo/feature/route/adapter/dialog.dart';
import 'package:sotwo/feature/route/route.dart';
import 'package:sotwo/feature/splash/page.dart';
import 'package:sotwo/test/individual/gwj/gwj.dart';
import 'package:sotwo/test/individual/gwj/security_keypad.dart';
import 'package:sotwo/test/individual/khh.dart';
import 'package:sotwo/test/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'router.g.dart';
part 'router.freezed.dart';

// TODO : Navigator Key 등을 관리할 클래스를 만들지 고민
final rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    initialLocation: SabRoute.root.partialPath,
    refreshListenable: ref.read(routerRefreshListenableProvider),
    observers: [
      SentryNavigatorObserver(),
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    redirect: (context, state) {
      return null;
    },
    routes: [
      _makeRoute(
        route: SabRoute.root,
        redirect: (context, state) {
          if (state.topRoute?.name == SabRoute.root.screenName) {
            return SabRoute.splash;
          }
          return null;
        },
        routes: [
          _makeRoute(
            route: SabRoute.splash,
            pageBuilder: (context, state, _) {
              return const NoTransitionPage(
                child: SplashScreenPage(),
              );
            },
          ),
          _makeRoute(
            route: SabRoute.initialVisitOnboarding,
            builder: (context, state, _) {
              return const InitialVisitOnboardingPage();
            },
          ),
          _makeRoute(
            route: SabRoute.revisitOnboarding,
            builder: (context, state, _) {
              return const RevisitOnboardingPage();
            },
          ),
          _makeRoute(
            route: SabRoute.initialBiometricRegister,
            builder: (context, state, _) {
              return const InitialBiometricRegisterPage();
            },
          ),
          _makeRoute<BiometricRegisterPageRoutingInfo>(
            route: SabRoute.biometricRegister,
            builder: (context, state, info) {
              return BiometricRegisterPage(info!);
            },
          ),
          _makeRoute(
            route: SabRoute.biometricLogin,
            builder: (context, state, _) {
              return const BiometricLoginPage();
            },
          ),
          _makeRoute(
            route: SabRoute.authForm,
            pageBuilder: (context, state, _) {
              // TODO : 추후 유형화 필요
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        CupertinoPageTransition(
                  primaryRouteAnimation: animation,
                  secondaryRouteAnimation: secondaryAnimation,
                  linearTransition: true,
                  child: child,
                ),
                child: const AuthFormPage(),
              );
            },
          ),
          _makeRoute(
            route: SabRoute.mobileCarrierBottomSheet,
            pageBuilder: (_, __, ___) => const SabBottomSheet(
              child: MobileCarrier(),
            ),
          ),
          _makeRoute(
            route: SabRoute.termsBottomSheet,
            pageBuilder: (_, __, ___) => const SabBottomSheet(
              child: Terms(),
            ),
          ),
          _makeRoute<TermsDetailPageRoutingInfo>(
            route: SabRoute.termsDetail,
            builder: (_, __, routingInfo) {
              return TermsDetailPage(
                routingInfo: routingInfo!,
              );
            },
          ),
        ],
        otherRoutes: [
          StatefulShellRoute.indexedStack(
            pageBuilder: (context, state, navigationShell) {
              return NoTransitionPage(
                child: MainShellPage(
                  navigationShell: navigationShell,
                ),
              );
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  _makeRoute(
                    route: SabRoute.home,
                    builder: (context, state, _) {
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            SabRoute.test.go(context);
                          },
                          child: const Text('Go to testMain'),
                        ),
                      );
                    },
                    routes: [
                      _makeRoute(
                        route: SabRoute.test,
                        parentNavigatorKey: rootNavigatorKey,
                        builder: (context, state, info) => const TestMainPage(),
                        otherRoutes: [
                          _makeRoute(
                            route: SabRoute.testKhh,
                            parentNavigatorKey: rootNavigatorKey,
                            pageBuilder: (context, state, info) =>
                                const CupertinoPage(
                              child: KhhTestPage(),
                            ),
                            otherRoutes: [
                              _makeRoute<KhhTestPageRoutingInfo>(
                                route: SabRoute.testKhhWithRoutingInfo,
                                parentNavigatorKey: rootNavigatorKey,
                                builder: (context, state, info) =>
                                    KhhTestPageWithRoutingInfo(info!),
                              ),
                              GoRoute(
                                parentNavigatorKey: rootNavigatorKey,
                                name: 'khhTestPage2',
                                path: 'khhTestPage',
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      context.goNamed('new_test');
                                    },
                                    child: const Text('to next!'),
                                  );
                                },
                              ),
                            ],
                          ),
                          _makeRoute(
                            route: SabRoute.testGwj,
                            parentNavigatorKey: rootNavigatorKey,
                            builder: (_, __, ___) => const GwjTestPage(),
                            otherRoutes: [
                              _makeRoute(
                                route: SabRoute.testGwjSecurityKeypad,
                                parentNavigatorKey: rootNavigatorKey,
                                builder: (_, __, ___) =>
                                    const SecurityKeypadTestPage(),
                              ),
                              _makeRoute(
                                route: SabRoute.testGwjDialog,
                                parentNavigatorKey: rootNavigatorKey,
                                pageBuilder: (_, __, ___) => const SabDialog(
                                  child: Center(
                                    child: Text('hello'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: 'abc',
                    path: 'abc',
                    builder: (context, state) {
                      return const Center(
                        child: Text('content'),
                      );
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    name: 'alarm',
                    path: 'alarm',
                    builder: (context, state) {
                      return const Center(
                        child: Text('game'),
                      );
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  _makeRoute(
                    route: SabRoute.my,
                    builder: (context, state, _) => const MyPage(),
                    routes: [
                      _makeRoute(
                        route: SabRoute.menu,
                        parentNavigatorKey: rootNavigatorKey,
                        builder: (context, state, info) => const MenuPage(),
                        routes: [
                          _makeRoute(
                            // TODO : 약관 및 정책 아래로 이동
                            route: SabRoute.openSourceLicense,
                            parentNavigatorKey: rootNavigatorKey,
                            builder: (context, state, _) =>
                                const OpenSourceLicensePage(),
                          ),
                          _makeRoute(
                            route: SabRoute.announcement,
                            parentNavigatorKey: rootNavigatorKey,
                            builder: (_, __, ___) =>
                                const AnnouncementListPage(),
                            routes: [
                              _makeRoute<AnnouncementDetailPageRoutingInfo>(
                                route: SabRoute.announcementDetail,
                                parentNavigatorKey: rootNavigatorKey,
                                builder: (_, __, info) =>
                                    AnnouncementDetailPage(
                                  routingInfo: info!,
                                ),
                              ),
                            ],
                          ),
                          _makeRoute(
                            route: SabRoute.event,
                            parentNavigatorKey: rootNavigatorKey,
                            builder: (_, __, ___) => const EventListPage(),
                            routes: [
                              _makeRoute<EventDetailPageRoutingInfo>(
                                route: SabRoute.eventDetail,
                                parentNavigatorKey: rootNavigatorKey,
                                builder: (_, __, info) => EventDetailPage(
                                  routingInfo: info!,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

final routerRefreshListenableProvider =
    ChangeNotifierProvider((ref) => RouterRefreshListenableNotifier());

class RouterRefreshListenableNotifier extends ChangeNotifier {
  RouterRefreshListenable? get data => _data;
  RouterRefreshListenable? _data;
}

@freezed
class RouterRefreshListenable with _$RouterRefreshListenable {
  factory RouterRefreshListenable({
    required final String? path,
  }) = _RouterRefreshListenable;

  factory RouterRefreshListenable.fromJson(Map<String, dynamic> json) =>
      _$RouterRefreshListenableFromJson(json);
}

/// [otherRoutes]는 GoRoute 외의 RouteBase의 추가가 필요한 경우에만 제한적으로 사용한다. 컴파일 타임에 하위 RoutingInfo에 제약을 걸 수 없음을 주의한다.
/// [routes] 뒤에 추가되는 것에 유의한다.
SabGoRoute<R> _makeRoute<R extends RoutingInfo>({
  required final SabRoute route,
  final GlobalKey<NavigatorState>? parentNavigatorKey,
  final FutureOr<SabRoute?> Function(
    BuildContext context,
    GoRouterState state,
  )? redirect,
  final List<SabGoRoute<R>>? routes,
  final List<RouteBase>? otherRoutes,
  final Widget Function(
    BuildContext context,
    GoRouterState state,
    R? info,
  )? builder,
  final Page<dynamic> Function(
    BuildContext context,
    GoRouterState state,
    R? info,
  )? pageBuilder,
}) =>
    SabGoRoute<R>(
      name: route.screenName,
      path: route.partialPath,
      parentNavigatorKey: parentNavigatorKey,
      routes: [
        if (routes != null) ...routes,
        if (otherRoutes != null) ...otherRoutes,
      ],
      redirect: (context, state) async {
        if (redirect == null) {
          return null;
        }
        final route = await redirect(context, state);
        if (route == null) {
          return null;
        }

        if (!context.mounted) {
          return null;
        }

        return state.namedLocation(route.screenName);
      },
      pageBuilder: builder != null
          ? (context, state) => MaterialPage(
                child: builder(
                  context,
                  state,
                  cast<R>(state.extra),
                ),
              )
          : pageBuilder != null
              ? (context, state) => pageBuilder(
                    context,
                    state,
                    cast<R>(state.extra),
                  )
              : null,
    );

/// 내부 Route 생성 규칙을 컴파일 타임에 제약하기 위한 도구. 런타임에 [R]이 수행하는 역할은 없다.
/// [GoRoute]의 시그니처가 변경되면 함께 변경되어야 한다.
/// 필요한 기능이 있다면 추가 혹은 변경할 것.

class SabGoRoute<R extends RoutingInfo> extends GoRoute {
  SabGoRoute({
    required super.path,
    super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.redirect,
    super.onExit,
    super.routes = const <RouteBase>[],
  });
}

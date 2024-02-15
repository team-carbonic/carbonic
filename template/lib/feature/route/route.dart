import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sotwo/core/utility/logger/logger.dart';
import 'package:sotwo/feature/announcement/ui/page/detail.dart';
import 'package:sotwo/test/individual/khh.dart';

/// 현재는 아무 역할도 하지 않음
abstract class RoutingInfo {
  const RoutingInfo();
}

/// ! 앞으로 딥링크로 사용되고 있는 라우트는 임의로 삭제되거나 이름이 변경되어서는 안 된다. 만약 변경이 불가피할 경우, 변경 이전 규격까지 지원해야 한다.
/// https://www.notion.so/c70dbd3ab2464e6db2ebe0aaee953375 참고
/// TODO : 문서 수정 필요
enum SabRoute {
  root,
  splash,
  initialVisitOnboarding,
  revisitOnboarding,

  authForm,
  mobileCarrierBottomSheet,
  termsBottomSheet,
  termsDetail,

  initialBiometricRegister,
  biometricRegister,
  biometricLogin,

  home,
  my,

  menu,
  announcement,
  announcementDetail,
  event,
  eventDetail,

  openSourceLicense,
  // ! 이하는 test page들만 추가한다.
  test,
  testKhh,
  testKhhWithRoutingInfo,
  testGwj,
  testGwjSecurityKeypad,
  testGwjDialog,
  ;

  String get screenName => switch (this) {
        _ => name,
      };

  String get partialPath => switch (this) {
        root => '/',
        _ => screenName,
      };

  String get deeplinkKey => switch (this) {
        _ => name,
      };

  void go<R extends RoutingInfo>(
    final BuildContext context, [
    final R? extra,
  ]) =>
      context.goNamed(screenName, extra: extra);

  Future<T?> push<T, R extends RoutingInfo>(
    final BuildContext context, [
    final R? extra,
  ]) =>
      context.pushNamed<T>(screenName, extra: extra);

  void pushReplacement<R extends RoutingInfo>(
    final BuildContext context, [
    final R? extra,
  ]) =>
      context.pushReplacementNamed(screenName, extra: extra);

  // void popUntil() {
  //   final context = SabRouter.currentContext;
  //   if (context == null) {
  //     return;
  //   }
  //   Navigator.popUntil(context, (route) {
  //     return route.isFirst || route.settings.name == screenName;
  //   });
  // }

  // /// delay 이후에 [context]를 사용하게 되므로, 해당 context의 존재 여부를 반드시 확신할 수 있어야 한다.
  // /// 존재 여부를 확신할 수 없는 경우, [context]를 null로 할당하면 [BlueRouter.currentContext]를 사용하게 된다.
  // void delayedGo<R extends RoutingInfo>(
  //   final BuildContext? context, {
  //   final R? extra,
  //   final Duration duration = const Duration(milliseconds: 500),
  // }) =>
  //     Future.delayed(
  //       duration,
  //       () => go(context ?? BlueRouter.currentContext!, extra),
  //     );

  // /// delay 이후에 [context]를 사용하게 되므로, 해당 context의 존재 여부를 반드시 확신할 수 있어야 한다.
  // /// 존재 여부를 확신할 수 없는 경우, [context]를 null로 할당하면 [BlueRouter.currentContext]를 사용하게 된다.
  // Future<T?> delayedPush<T, R extends RoutingInfo>(
  //   final BuildContext? context, {
  //   final R? extra,
  //   final Duration duration = const Duration(milliseconds: 500),
  // }) =>
  //     Future.delayed(
  //       duration,
  //       () => push<T, R>(context ?? BlueRouter.currentContext!, extra),
  //     );

  static SabRoute? fromDeepLinkKey(final String key) {
    return SabRoute.values.firstWhereOrNull(
      (route) => route.deeplinkKey == key,
    );
  }

  RoutingInfo? makeRoutingInfo(final Map<String, String> queryParameters) {
    try {
      return switch (this) {
        announcementDetail =>
          AnnouncementDetailPageRoutingInfo.fromQueryParameters,
        testKhhWithRoutingInfo => KhhTestPageRoutingInfo.fromQueryParameters,
        _ => null,
      }
          ?.call(queryParameters);
    } catch (e, s) {
      Logger.error(
        title: 'routing info 생성 실패',
        content: 'name: $screenName\nqueryParameters: $queryParameters',
        exception: e,
        stackTrace: s,
      );
      // * rethrow를 하지 않을 경우, 해당 페이지로 이동하면서 에러가 발생한다. 이유는 알 수 없으나, rethrow된 exception은 어디에서도 catch되지 않는 것으로 보인다.
      rethrow;
    }
  }
}

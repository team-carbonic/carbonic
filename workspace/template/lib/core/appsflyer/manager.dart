import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:sotwo/core/config/flavor.dart';
import 'package:sotwo/feature/route/deeplink/handler.dart';

class AppsflyerManager {
  const AppsflyerManager._();

  static Future<void> initialize() async {
    final sdk = AppsflyerSdk(
      AppsFlyerOptions(
        afDevKey: F.flavor.appsflyerDevKey,
        appId: F.flavor.appstoreAppId ?? '',
        // showDebug: !F.flavor.isLive, // 필요한 경우에만 사용할 것(너무 난잡함)
      ),
    );

    await sdk.initSdk(
      registerOnDeepLinkingCallback: true,
    );

    sdk.onDeepLinking(_onDeepLinking);
  }

  static void _onDeepLinking(final DeepLinkResult result) {
    final uri = _makeDeepLinkUri(result);
    if (uri == null) {
      return;
    }

    DeeplinkHandler.handleDeepLink(uri);
  }

  static Uri? _makeDeepLinkUri(final DeepLinkResult result) {
    if (result.status != Status.FOUND) {
      return null;
    }

    // * onelink의 deepLinkValue는 반드시 path + query parameters로 구성되어 있음을 가정한다.
    final deepLinkValue = result.deepLink?.deepLinkValue;
    if (deepLinkValue == null) {
      return null;
    }

    return Uri.parse('https://sotwo.com/$deepLinkValue');
  }
}

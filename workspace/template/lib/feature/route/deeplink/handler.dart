import 'package:app_links/app_links.dart';
import 'package:sotwo/feature/route/route.dart';
import 'package:sotwo/feature/route/router.dart';

class DeeplinkHandler {
  const DeeplinkHandler._();

  static Uri? _initialUri;
  static Uri? useInitialUri() {
    final uri = _initialUri;
    _initialUri = null;
    return uri;
  }

  static void initialize() {
    AppLinks().uriLinkStream.listen(handleDeepLink);

    AppLinks().getInitialAppLink().then((uri) {
      if (uri == null) {
        return;
      }
      handleDeepLink(uri);
    });
  }

  static void handleDeepLink(final Uri uri) {
    final context = rootNavigatorKey.currentContext;
    if (context == null) {
      _initialUri = uri;
      return;
    }

    if (!context.mounted) {
      return;
    }

    final route = SabRoute.fromDeepLinkKey(uri.path.replaceFirst('/', ''));
    if (route == null) {
      return;
    }

    final routingInfo = route.makeRoutingInfo(uri.queryParameters);
    route.go(context, routingInfo);
  }
}

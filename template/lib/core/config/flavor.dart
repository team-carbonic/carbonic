import 'package:flutter/foundation.dart';
import 'dart:io';

enum Flavor {
  dev,
  stage,
  prod,
  ;

  bool get isLive => isProd && kReleaseMode;
  bool get isProd => this == Flavor.prod;
  String get appName => switch (this) {
        dev => 'SOTWO DEV',
        stage => 'SOTWO QA',
        prod => 'SOTWO',
      };

  String get baseServerUrl => switch (this) {
        dev => legacyServerUrl,
        stage => legacyServerUrl,
        prod => legacyServerUrl,
      };

  String get legacyServerUrl => switch (this) {
        dev => 'https://prod.sotwo.com',
        stage => 'https://api-m.qa.so2blue.co.kr',
        prod => 'https://api-m.dev.so2blue.co.kr',
      };

  String? get appstoreAppId => Platform.isIOS
      ? switch (this) {
          dev || stage => '6473598688',
          prod => '2Q2Q2Q2Q2Q2Q2Q2Q2Q',
        }
      : null;

  String get sentryDsn =>
      'https://46123b00fc7eb3f7eed7516f6c06394d@o4506498504196096.ingest.sentry.io/4506498505441280';

  double get sentryTracesSampleRate => switch (this) {
        dev || stage => 1.0,
        prod => 0.7,
      };

  String get appsflyerDevKey => switch (this) {
        dev || stage => Platform.isAndroid
            ? 'oPBu3BRsc5BUpaCDZY88x9'
            : 'oPBu3BRsc5BUpaCDZY88x9',
        prod => '2Q2Q2Q2Q2Q2Q2Q2Q2Q',
      };
}

class F {
  const F._();

  static late final Flavor flavor;
}

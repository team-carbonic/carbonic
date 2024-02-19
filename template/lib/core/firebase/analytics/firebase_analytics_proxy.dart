part of 'manager.dart';

class _FirebaseAnalayticsProxy {
  static FirebaseAnalytics get _instance => FirebaseAnalytics.instance;

  static Future<void> initialize() async {
    await _instance.setAnalyticsCollectionEnabled(true);

    // TODO : 모든 이벤트에 공통으로 담을 파라미터가 있을까?
    // await _instance.setDefaultEventParameters();
  }

  // TODO : screenName -> SabRouteType(?)을 받도록 수정
  static Future<void> logScreenView({
    required String screenName,
  }) =>
      _catchError(
        () => _instance.logEvent(
          name: 'screen_view',
          parameters: {
            'firebase_screen': screenName,
          },
        ),
      );

  static Future<void> logSignUp({
    required String signUpMethod,
    Map<String, Object?>? parameters,
  }) =>
      _catchError(
        () => _instance.logSignUp(
          signUpMethod: signUpMethod,
          parameters: parameters,
        ),
      );

  static Future<void> logLogin({
    required final String loginMethod,
    Map<String, Object?>? parameters,
    AnalyticsCallOptions? callOptions,
  }) =>
      _catchError(
        () => _instance.logLogin(
          loginMethod: loginMethod,
          parameters: parameters,
          callOptions: callOptions,
        ),
      );

  static Future<void> setUserId({
    required final String? id,
    AnalyticsCallOptions? callOptions,
  }) =>
      _catchError(
        () => _instance.setUserId(id: id, callOptions: callOptions),
      );

  static Future<void> logSearch({
    required String searchTerm,
    Map<String, Object?>? parameters,
    AnalyticsCallOptions? callOptions,
  }) =>
      _catchError(
        () => _instance.logSearch(
          searchTerm: searchTerm,
          parameters: parameters,
          callOptions: callOptions,
        ),
      );

  static Future<void> logEvent({
    required String name,
    Map<String, Object?>? parameters,
    AnalyticsCallOptions? callOptions,
  }) =>
      _catchError(
        () => _instance.logEvent(
          name: name,
          parameters: parameters,
          callOptions: callOptions,
        ),
      );

  static Future<void> _catchError(final Future Function() asyncFunction) async {
    try {
      await asyncFunction();
    } catch (e, s) {
      Logger.error(
        title: 'Error Occurred in $_FirebaseAnalayticsProxy',
        exception: e,
        stackTrace: s,
      );
    }
  }
}

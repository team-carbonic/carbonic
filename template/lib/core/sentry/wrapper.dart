import 'package:sentry_flutter/sentry_flutter.dart';

// TODO : 추후 유저 정보가 추가되면 scope에 extra로 추가한다.
class SentryWrapper {
  const SentryWrapper._();

  static void captureException({
    final String? title,
    final String? content,
    final Object? exception,
    final StackTrace? stackTrace,
  }) {
    try {
      Sentry.captureException(
        Exception(
          '${title != null ? '\ntitle: $title' : ''}${content != null ? '\ncontent: $content' : ''}${exception != null ? '\n$exception' : null}',
        ),
        stackTrace: stackTrace,
      );
    } catch (_) {}
  }

  static void addBreadcrumb({
    required final String message,
  }) {
    try {
      Sentry.addBreadcrumb(
        Breadcrumb(
          message: message,
        ),
      );
    } catch (_) {}
  }
}

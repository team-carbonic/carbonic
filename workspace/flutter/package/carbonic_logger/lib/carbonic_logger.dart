library carbonic_logger;

import 'package:carbonic_logger/src/core.dart';
import 'package:carbonic_logger/src/custom_trace.dart';
import 'package:flutter/widgets.dart';

/// ### 설명
/// - 릴리즈 모드일때 터미널 출력 로직은 실행되지 않는다.
/// - 로그 형식은 [LoggerCore] 클래스가 제공하는 형식을 그대로 따른다.
/// - [warning], [error] 함수의 경우, 호출스택을 표시하는 것이 기본이며, 변경 가능하다.
/// - [error] 함수의 경우, UI 상 경고창을 띄우는 것이 기본이며, 변경 가능하다.
///
/// ### 사용 방법
/// - [test], [info], [warning], [error] 함수들 중, 상황에 맞는 로깅 함수를 호출한다.
///
/// ### 사용 예시
/// ```dart
/// Logger.info(
///   'User logined.',
///   title: 'Auth',
///   category: 'auth',
/// );
///
/// try {
///   ...
/// }
/// catch (e, s) {
///   Logger.error(
///     'Login has been failed.',
///     title: 'Auth',
///     category: 'auth',
///     exception: e,
///     stackTrace: s,
///   );
/// }
/// ```
class Logger {
  const Logger._();

  static ExtraLogHandler? _extraErrorHandler;
  static ExtraLogHandler? _extraWarningHandler;
  static ExtraLogHandler? _extraInfoHandler;

  static void setExtraHandlers({
    final ExtraLogHandler? errorHandler,
    final ExtraLogHandler? warningHandler,
    final ExtraLogHandler? infoHandler,
  }) {
    _extraErrorHandler = errorHandler ?? _extraErrorHandler;
    _extraWarningHandler = warningHandler ?? _extraWarningHandler;
    _extraInfoHandler = infoHandler ?? _extraInfoHandler;
  }

  /// ### 설명
  /// 단순 테스트용 로그를 출력한다.
  ///
  /// ### 주의
  /// 오로지 개인 작업 중의 테스트 용도로만 사용하고, 테스트 종료 시 해당 호출부도 제거하여 다른 작업자가 로그를 보는 데 불편함이 없도록 한다.
  static void test({
    final String? content,
    final Object? exception,
    final StackTrace? stackTrace,
    final int maxStackTraceLine = 20,
    final bool hideStackTrace = true,
  }) {
    try {
      LoggerCore.log(
        logLevel: LogLevel.test,
        content: content,
        category: 'test',
        exception: exception,
        stackTrace: stackTrace,
        maxStackTraceLine: maxStackTraceLine,
        hideStackTrace: hideStackTrace,
      );
    } catch (_) {
      debugPrint('********** Logger Has Error **********');
    }
  }

  /// ### 설명
  /// - 정보성 로그를 표시한다.
  /// - [hideStackTrace]의 기본값이 true로, 호출스택을 표시하지 않는다.
  static void info({
    final String? title,
    final String? content,
    final String? category,
    final Object? exception,
    final StackTrace? stackTrace,
    final int maxStackTraceLine = 20,
    final bool hideStackTrace = true,
  }) {
    try {
      final newStackTrace = stackTrace ?? StackTrace.current.removeTop(1);

      _extraInfoHandler?.call(
        title: title,
        content: content,
        exception: exception,
        stackTrace: newStackTrace,
      );

      LoggerCore.log(
        logLevel: LogLevel.info,
        title: title,
        content: content,
        category: category,
        exception: exception,
        stackTrace: newStackTrace,
        maxStackTraceLine: maxStackTraceLine,
        hideStackTrace: hideStackTrace,
      );
    } catch (_) {
      debugPrint('********** Logger Has Error **********');
    }
  }

  /// ### 설명
  /// - 경고성 로그를 표시한다.
  /// - [hideStackTrace]의 기본값이 false로, 호출스택을 표시한다.
  static void warning({
    final String? title,
    final String? content,
    final String? category,
    final Object? exception,
    final StackTrace? stackTrace,
    final int maxStackTraceLine = 20,
    final bool hideStackTrace = false,
  }) {
    try {
      final newStackTrace = stackTrace ?? StackTrace.current.removeTop(1);

      _extraWarningHandler?.call(
        title: title,
        content: content,
        exception: exception,
        stackTrace: newStackTrace,
      );

      LoggerCore.log(
        logLevel: LogLevel.warning,
        title: title,
        content: content,
        category: category,
        exception: exception,
        stackTrace: newStackTrace,
        maxStackTraceLine: maxStackTraceLine,
        hideStackTrace: hideStackTrace,
      );
    } catch (_) {
      debugPrint('********** Logger Has Error **********');
    }
  }

  /// ### 설명
  /// - 에러 로그를 표시한다.
  /// - [hideStackTrace]의 기본값이 false로, 호출스택을 표시한다.
  static void error({
    final String? title,
    final String? content,
    final String? category,
    final Object? exception,
    final StackTrace? stackTrace,
    final int maxStackTraceLine = 20,
    final bool hideStackTrace = false,
  }) {
    try {
      final newStackTrace = stackTrace ?? StackTrace.current.removeTop(1);

      _extraErrorHandler?.call(
        title: title,
        content: content,
        exception: exception,
        stackTrace: newStackTrace,
      );

      LoggerCore.log(
        logLevel: LogLevel.error,
        title: title,
        content: content,
        category: category,
        exception: exception,
        stackTrace: newStackTrace,
        maxStackTraceLine: maxStackTraceLine,
        hideStackTrace: hideStackTrace,
      );
    } catch (_) {
      debugPrint('********** Logger Has Error **********');
    }
  }
}

typedef ExtraLogHandler = void Function({
  String? title,
  String? content,
  Object? exception,
  StackTrace? stackTrace,
});

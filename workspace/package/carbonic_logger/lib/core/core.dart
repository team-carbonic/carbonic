import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logger/core/custom_trace.dart';
import 'package:logger/core/log_color_tag.dart';

/// 로그 수준에 대한 열거형으로, 로그 수준에 맞는 색상, 텍스트 효과 등을 가져올 수 있다.
enum LogLevel {
  test(' personal '),
  info('   info   '),
  warning(' warning  '),
  error('  error   '),
  fatal('  fatal   ');

  final String string;
  const LogLevel(this.string);

  LogColorCode get color {
    switch (this) {
      case LogLevel.test:
        return LogColorCode.white;
      case LogLevel.info:
        return LogColorCode.green;
      case LogLevel.warning:
        return LogColorCode.yellow;
      case LogLevel.error:
        return LogColorCode.red;
      case LogLevel.fatal:
        return LogColorCode.magenta;
    }
  }

  LogColorCode get brightColor {
    switch (this) {
      case LogLevel.test:
        return LogColorCode.brightWhite;
      case LogLevel.info:
        return LogColorCode.brightGreen;
      case LogLevel.warning:
        return LogColorCode.brightYellow;
      case LogLevel.error:
        return LogColorCode.brightRed;
      case LogLevel.fatal:
        return LogColorCode.brightMagenta;
    }
  }

  LogEffectCode? get effect {
    switch (this) {
      case LogLevel.test:
        return null;
      case LogLevel.info:
        return null;
      case LogLevel.warning:
        return null;
      case LogLevel.error:
        return LogEffectCode.flickering;
      case LogLevel.fatal:
        return LogEffectCode.fastFlickering;
    }
  }
}

enum LogCategory {
  test,
  network,
  analytics,
  notification,
  localStorage,
  permission,
  securityKeypad,

  utility,
  ;
}

/// ### 설명
/// 개발 편의를 위해 로깅이 필요할 때 [LoggerCore]의 함수들을 이용한다.
/// - [categoryFilter] : 출력될 로그 필터링
/// - [log] : 일반 로그 출력용 함수
///
/// ### 로그 형식
///
/// 기본 로그 형식은 아래와 같으며, 함수 이름, 파일 이름, 예외, 호출스택은 존재할때만 표시된다.
///
/// ```text
/// [ logLevel ] time [ category ] from 'functionName' of 'fileName'
/// <Title>
/// Content
/// Exception: exception
///
/// ----- Start of Stack Trace -----
/// #0    function
/// #1    main
/// ----- End of Stack Trace -----
/// ```
class LoggerCore {
  static const _releaseMode = kReleaseMode;
  static final LogColorTag _resetColorTag = LogColorCode.reset.toTag();

  /// 해당 값이 null이 아니면 특정 카테고리의 로그만 출력한다.
  static LogCategory? categoryFilter;

  /// 터미널에 [content]에 해당하는 로그를 출력한다.
  /// Release 빌드일 때는 Sentry 측에 예외와 호출스택 정보만 전달하고, 터미널 출력부는 실행되지 않는다.
  static void log({
    required final LogLevel logLevel,
    final String? content,
    final String? title,
    final LogCategory? category,
    final Object? exception,
    final StackTrace? stackTrace,
    final int maxStackTraceLine = 20,
    final bool hideStackTrace = false,
  }) {
    // 릴리즈 모드 로깅 제외
    if (_releaseMode) {
      return;
    }
    // 로그 카테고리 필터링
    if (categoryFilter != null && category != categoryFilter) {
      return;
    }

    final levelString = logLevel.string;
    final baseColor = logLevel.color;
    final brightColor = logLevel.brightColor;
    final levelColorTag = brightColor.toTag(logLevel.effect);
    final titleColorTag = brightColor.toTag();
    final contentColorTag = baseColor.toTag();
    final stackTraceColorTag = brightColor.toTag(LogEffectCode.dark);

    String? refinedStackTrace;
    if (stackTrace != null) {
      final splitStackTrace = stackTrace.toString().split('\n');
      refinedStackTrace = splitStackTrace
          .getRange(0, min(splitStackTrace.length, maxStackTraceLine))
          .fold(
            '',
            (previousValue, element) =>
                '${previousValue!}\n$stackTraceColorTag$element',
          );
    }

    CustomTrace? customTrace;
    if (stackTrace != null) {
      customTrace = CustomTrace(stackTrace);
    }

    final contentString = content?.replaceAll('\n', '\n$contentColorTag');
    var exceptionMessageString =
        exception?.toString().replaceAll('\n', '\n$contentColorTag');
    exceptionMessageString =
        exceptionMessageString == '' ? null : exceptionMessageString;

    final logString =
        // 로깅 레벨 표시
        '$levelColorTag[$levelString]'
        // 시간 표시
        ' $_resetColorTag$titleColorTag${DateTime.now()}'
        // 카테고리 표시
        '${category == null ? '' : ' [ $_resetColorTag$titleColorTag${category.name} ]'}'
        // 함수 이름, 파일 이름 표시
        '${customTrace == null ? '' : "$_resetColorTag$titleColorTag from '${customTrace.functionName}()' of '${customTrace.fileName}'"}'
        // 제목 표시
        '${title == null ? '' : '\n'
            '$_resetColorTag$titleColorTag<$title>'}'
        // 내용 표시
        '${contentString == null ? '' : '\n$_resetColorTag$contentColorTag$contentString'}'
        // Exception 표시
        '${exception == null ? '' : '\n'
            '\n$_resetColorTag${titleColorTag}Exception: $_resetColorTag$contentColorTag${exception.runtimeType}'}'
        '${exceptionMessageString == null ? '' : '\n'
            '\n$_resetColorTag$titleColorTag----- Start of Exception Message -----'
            '\n$_resetColorTag$titleColorTag$_resetColorTag$contentColorTag$exceptionMessageString'
            '\n$_resetColorTag$titleColorTag----- End of Exception Message -----'}'
        // StackTrace 표시
        '${hideStackTrace || stackTrace == null ? '' : '\n'
            '\n$_resetColorTag$titleColorTag----- Start of Stack Trace -----'
            '$refinedStackTrace'
            '\n$_resetColorTag$titleColorTag----- End of Stack Trace -----'
            '$_resetColorTag'}'
        '\n';
    developer.log(logString);
  }
}

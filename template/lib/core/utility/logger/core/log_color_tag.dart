typedef LogColorTag = String;

/// ANSI Escape Code를 이용해 터미널에서의 텍스트 색상을 표현할 때,
/// 색상에 해당하는 정수값들을 열거형으로 재정의한 것이다.\
/// [toTag] 함수의 반환값과 사용자의 로그 메시지를 조합한 String을
/// dart:developer 패키지의 [log] 함수의 [message] 파라미터로 전달하면,
/// 색상 또는 효과가 적용된 로그 메시지를 볼 수 있다.
///
/// 아래는 사용 예시 및 응용 방법이다.
///
/// ```dart
/// import 'dart:developer' as developer;
///
/// // 노란색에 밑줄 효과가 있는 텍스트 출력 후, 색상과 효과를 되돌려 놓는다.
/// developer.log('${LogColorCode.yellow.toTag(LogEffectCode.underline)}This is Log String.${LogColorCode.reset.toTag()}');
///
/// // 터미널 텍스트 기본 색상을 기반으로 깜빡임 효과를 준다.
/// developer.log('${LogEffectCode.flickering.toTag()} This is Log String.')
///
/// // 각종 효과 확인하기
/// for (int i = 1; i <= 255; ++i) {
///   developer.log('$i : \x1b[${i}m This is Log String');
/// }
///
/// // 빨간색(31)을 기반으로 각종 효과 확인하기
/// for (int i = 1; i <= 255; ++i) {
///   developer.log('$i : \x1b[31;${i}m This is Log String');
/// }
/// ```
enum LogColorCode {
  reset(0),

  black(30),
  red(31),
  green(32),
  yellow(33),
  blue(34),
  magenta(35),
  cyan(36),
  white(37),

  brightBlack(90),
  brightRed(91),
  brightGreen(92),
  brightYellow(93),
  brightBlue(94),
  brightMagenta(95),
  brightCyan(96),
  brightWhite(97);

  final int value;
  const LogColorCode(this.value);

  LogColorTag toTag([final LogEffectCode? effectCode]) {
    return '\x1b[$value${effectCode == null ? '' : ';${effectCode.value}'}m';
  }
}

enum LogEffectCode {
  dark(2),
  italic(3),
  underline(4),
  flickering(5),
  fastFlickering(6),
  cancelLine(9);

  final int value;
  const LogEffectCode(this.value);

  /// 터미널 텍스트 기본 색상을 기반으로 효과를 준다.
  LogColorTag toTag() {
    return '\x1b[${value}m';
  }
}

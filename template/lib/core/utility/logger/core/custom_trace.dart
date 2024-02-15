/// [StackTrace] 문자열을 파싱하여 사용 편의성을 향상시킨 클래스이다.
/// 파일 이름([fileName]), 함수 이름([functionName]), 호출자 이름([callerFunctionName]),
/// 파일 내 라인 넘버([lineNumber]), 컬럼 넘버([columnNumber]) 등을 얻을 수 있다.
///
/// ```dart
/// try{
///   errorGenerator();
/// } catch(e, s) {
///   final customTrace = CustomTrace(stackTrace);
///   print('Error occurred on ${customTrace.fileName}, ${customTrace.functionName}');
/// }
/// ```
class CustomTrace {
  final StackTrace _stackTrace;

  String get fileName => _fileName;
  String _fileName = '';

  String get functionName => _functionName;
  String _functionName = '';

  String? get callerFunctionName => _callerFunctionName;
  String? _callerFunctionName = '';

  int get lineNumber => _lineNumber;
  int _lineNumber = 0;

  int get columnNumber => _columnNumber;
  int _columnNumber = 0;

  CustomTrace(final StackTrace stackTrace) : _stackTrace = stackTrace {
    _parceStackTrace();
  }

  void _parceStackTrace() {
    final frames = _getOnlyFrames(_stackTrace.toString());

    if (frames.isEmpty) {
      _fileName = 'Unknown';
      _lineNumber = 0;
      _columnNumber = 0;
      return;
    }

    /* The first frame is the current function */
    _functionName = _getFunctionNameFromFrame(frames[0]);

    /* The second frame is the caller function */
    if (frames.length > 1) {
      _callerFunctionName = _getFunctionNameFromFrame(frames[1]);
    }

    /* The first frame has all the information we need */
    final traceString = frames[0];

    /* Search through the string and find the index of the file name by looking for the '.dart' regex */
    final indexOfFileName = traceString.indexOf(RegExp('[A-Za-z]+.dart'));
    final fileInfo = traceString.substring(indexOfFileName);

    final listOfInfos = fileInfo.split(':');

    /* Splitting fileInfo by the character ":" separates the file name, the line number and the column counter nicely.
      Example: main.dart:5:12
      To get the file name, we split with ":" and get the first index
      To get the line number, we would have to get the second index
      To get the column number, we would have to get the third index
    */

    _fileName = listOfInfos[0];
    _lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(')', '');
    _columnNumber = int.parse(columnStr);
  }

  String _getFunctionNameFromFrame(final String frame) {
    final currentTrace = frame;

    var indexOfWhiteSpace = currentTrace.indexOf(' ');
    if (indexOfWhiteSpace == -1) {
      return '';
    }
    var subStr = currentTrace.substring(indexOfWhiteSpace);

    final indexOfFunction = subStr.indexOf(RegExp('[A-Za-z0-9]'));
    if (indexOfFunction == -1) {
      return '';
    }
    subStr = subStr.substring(indexOfFunction);

    indexOfWhiteSpace = subStr.indexOf(' ');
    if (indexOfWhiteSpace != -1) {
      subStr = subStr.substring(0, indexOfWhiteSpace);
    }

    final indexOfAdditionalInfo = subStr.indexOf('.<');
    if (indexOfAdditionalInfo != -1) {
      subStr = subStr.substring(0, indexOfAdditionalInfo);
    }

    return subStr;
  }

  bool _isStackFrame(final String targetString) {
    return RegExp(r'#\d+').matchAsPrefix(targetString, 0) != null;
  }

  List<String> _getOnlyFrames(final String stackTrace) {
    final frames = _stackTrace.toString().split('\n').reversed.toList();
    return frames.where((frame) => _isStackFrame(frame)).toList();
  }
}

/// StackTrace에 [removeTop] 기능 추가
///
/// [removeTop] : 호출 스택의 상위 데이터 중 입력된 정수 크기만큼 제거한다.
extension StackTraceEx on StackTrace {
  StackTrace removeTop(final int countToRemove) {
    final frames = toString().split('\n');

    final outerStackTraceString = frames
        .getRange(countToRemove, frames.length)
        .map(
          (frame) => frame.replaceFirstMapped(RegExp(r'#\d+'), (match) {
            // '#' 문자 뒤의 숫자를 countToRemove 만큼 감소시킨다.
            return '#${int.parse(match.input.substring(match.start + 1, match.end)) - countToRemove}';
          }),
        )
        .join('\n');
    return StackTrace.fromString(outerStackTraceString);
  }
}

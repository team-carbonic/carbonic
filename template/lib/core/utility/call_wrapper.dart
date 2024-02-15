import 'dart:async';
import 'dart:collection';

/// [Throttler]을 사용하면 특정 함수가 반복적으로 사용되기 위한 최소 시간 간격을 설정할 수 있다.
class Throttler {
  const Throttler._();

  static final _syncKeys = HashSet<int>();
  static final _asyncKeys = HashSet<int>();

  /// [hashCode]는 기능을 막고 싶은 범위에 해당하는 위젯의 hashcode이다.
  /// [blockingTime] 동안 [func]의 재호출을 막아준다.
  /// 그 동안 재호출될 경우, null을 반환한다.
  static FutureOr<T>? processSync<T>(
    final int hashCode,
    final FutureOr<T>? Function() func, {
    final Duration blockingTime = const Duration(milliseconds: 300),
  }) {
    if (_syncKeys.contains(hashCode)) {
      return null;
    }
    _syncKeys.add(hashCode);
    Timer(blockingTime, () => _syncKeys.remove(hashCode));
    return func();
  }

  /// [hashCode]는 기능을 막고 싶은 범위에 해당하는 위젯의 hashcode이다.
  /// 재호출될 경우, null을 반환한다.
  static Future<T?>? processAsync<T>(
    final int hashCode,
    final Future<T?> Function() func,
  ) async {
    if (_asyncKeys.contains(hashCode)) {
      return null;
    }
    _asyncKeys.add(hashCode);
    late final T? result;
    try {
      result = await func();
    } catch (_) {
      rethrow;
    } finally {
      _asyncKeys.remove(hashCode);
    }
    return result;
  }
}

// TODO : 쓸 건지 말 건지 결정 필요...
// class DoOnce {
//   var _done = false;

//   void call<T>(final FutureOr<T?> Function() func) {
//     if (_done) {
//       return;
//     }

//     _done = true;
//     try {
//       func();
//     } catch (e, s) {
//       Logger.warning(
//         title: 'DoOnce',
//         content: 'function not handle exception',
//         exception: e,
//         stackTrace: s,
//       );
//     }
//   }
// }

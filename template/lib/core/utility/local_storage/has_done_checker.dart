import 'package:sotwo/core/utility/cast.dart';
import 'package:sotwo/core/utility/local_storage/manager.dart';
import 'package:sotwo/core/utility/time/time.dart';

enum HasDoneCheckerCategory {
  temp, // TODO 새로운 항목 추가 시 제거
  ;

  String get key => name.replaceAllMapped(
        RegExp('[A-Z]'),
        (match) => '_${match.group(0)!.toLowerCase()}',
      );
}

/// 어떤 행위를 특정 시간 이전에 했는지 로컬에서 체크하는 데 사용한다.
///
/// 다음과 같이 사용한다.
/// ```
/// final doneTime = HasDoneChecker.getDoneTime(
///   category: HasDoneCheckerCategory.test,
///   userId: 1234,
///   extraIdentifier: 'content_1',
/// );
/// if (doneTime == null) {
///   HasDoneChecker.setDone(
///     category: HasDoneCheckerCategory.test,
///     doneTime: SabDateTime.today(),
///     userId: 1234,
///     extraIdentifier: 'content_1',
///   );
/// }
/// Text(
///   doneTime == null
///       ? '최초입니다.'
///       : doneTime.data.isAfter(DateTime(11시 30분))
///           ? '11시 30분 넘어서 했습니다.'
///           : doneTime.data.isToday
///               ? '오늘 이미 했습니다.'
///               : '옛날에 했습니다.',
/// );
/// ```
class HasDoneChecker {
  const HasDoneChecker._();
  static const storageKeyPrefix = 'has_done_checker';

  static SabDateTime? getDoneTime({
    required final HasDoneCheckerCategory category,
    final int? userId,
    final String? extraIdentifier,
  }) {
    try {
      final data = LocalStorageManager.getData(
        category: LocalStorageCategory.hasDoneChecker,
        userId: userId,
        extraIdentifier: _makeIdentifier(category, extraIdentifier),
      );

      if (data == null) {
        return null;
      }
      return SabDateTime.fromJson(
        cast<String>(
          data['time'],
        )!,
      );
    } catch (_) {
      return null;
    }
  }

  static void setDone({
    required final HasDoneCheckerCategory category,
    final int? userId,
    final String? extraIdentifier,
    required final SabDateTime doneTime,
  }) {
    try {
      final data = {
        'time': doneTime.toJson(),
      };
      LocalStorageManager.setData(
        category: LocalStorageCategory.hasDoneChecker,
        userId: userId,
        extraIdentifier: _makeIdentifier(category, extraIdentifier),
        data: data,
      );
    } catch (_) {}
  }

  static void clear(final HasDoneCheckerCategory category) {
    LocalStorageManager.clearByIdentifier(
      category: LocalStorageCategory.hasDoneChecker,
      extraIdentifier: category.key,
    );
  }

  static String _makeIdentifier(
    final HasDoneCheckerCategory category,
    final String? extraIdentifier,
  ) =>
      '${category.key}_$extraIdentifier';
}

// import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dart_date/dart_date.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sotwo/core/utility/time/day_of_week.dart';

part 'time.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class SabDateTime with _$SabDateTime {
  const SabDateTime._();

  /// MM.DD (m) AM/PM HH:MM
  String get stringType1 =>
      '$paddedMonth.$paddedDay (${DayOfWeek.fromWeekday(data.weekday).shortText}) ${data.hour < 12 ? 'AM' : 'PM'} $paddedHour:$paddedMinute';
  String get yearToDay1 => '$year.$paddedMonth.$paddedDay';
  String get yearToMinute1 => '$yearToDay1 $paddedHour:$paddedMinute';

  int get year => data.year;
  String get paddedMonth => _makePadded(data.month);
  String get paddedDay => _makePadded(data.day);
  String get paddedHour => _makePadded(data.hour);
  String get paddedMinute => _makePadded(data.minute);

  factory SabDateTime.now() => SabDateTime(
        data: DateTime.now(),
      );
  factory SabDateTime.today() => SabDateTime(
        data: DateTime.now().startOfDay,
      );

  bool isAfter(final SabDateTime other) => data.isAfter(other.data);
  bool isSameOrAfter(final SabDateTime other) => data.isSameOrAfter(other.data);
  bool isBefore(final SabDateTime other) => data.isBefore(other.data);
  bool isSameOrBefore(final SabDateTime other) =>
      data.isSameOrBefore(other.data);

  String _makePadded(
    final int value, [
    final int paddedSize = 2,
  ]) =>
      value.toString().padLeft(paddedSize, '0');

  factory SabDateTime({
    required DateTime data,
  }) = _SabDateTime;

  factory SabDateTime.fromJson(String data) =>
      SabDateTime(data: TimeConverter.fromServerString(data));

  String toJson() => TimeConverter.toServerString(data);
}

class TimeConverter {
  static DateTime fromServerString(final String serverString) {
    final result = DateTime.parse(serverString);
    return result;
  }

  static String toServerString(final DateTime dateTime) {
    return dateTime.toString();
  }
}

enum DayOfWeek {
  sun,
  mon,
  tue,
  wed,
  thu,
  fri,
  sat;

  factory DayOfWeek.fromWeekday(final int weekday) =>
      values[weekday % DateTime.daysPerWeek];

  String get shortText => switch (this) {
        sun => '일',
        mon => '월',
        tue => '화',
        wed => '수',
        thu => '목',
        fri => '금',
        sat => '토',
      };
}

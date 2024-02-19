/// 금융사
enum FinancialCorporation {
  kb('kb'),
  nh('nh'),
  ;

  final String value;
  const FinancialCorporation(this.value);
}

/// 투자성향 등급
enum InvestmentBiasGrade {
  grade1(1),
  grade2(2),
  grade3(3),
  grade4(4),
  grade5(5),
  ;

  final int value;
  const InvestmentBiasGrade(this.value);
  factory InvestmentBiasGrade.fromGradeValue(final int value) =>
      InvestmentBiasGrade.values.firstWhere((e) => e.value == value);
}

/// 기존에 주문 상태를 정의하는 enum 타입이 있다면, [OrderStatus]는 폐기하고 그 타입을 사용할 것.
/// 추가로 필요한 enum 값이 있다면 아래에 추가해서 사용할 것.
enum OrderStatus {
  canceled('주문 취소'),
  completed('주문 완료'),
  ;

  final String value;
  const OrderStatus(this.value);
}

/// [double]과 [String] 타입의 경우는 특수 처리를 하고 있다.
/// [x]가 [num] 타입이고 [T]는 [double] 타입일 경우, [x]의 값이 [double]로 반환된다.
/// [T]가 [String] 타입일 경우, [x.toString]의 결과가 반환된다.
T? cast<T>(final dynamic x) {
  if (x == null) {
    return null;
  }
  try {
    switch (T) {
      case const (double):
        return (x as num).toDouble() as T;
      case const (String):
        return x == null ? x : x.toString();
      case const (int):
        return (x as num).toInt() as T;
      default:
        return x as T;
    }
  } catch (_, __) {
    return null;
  }
}

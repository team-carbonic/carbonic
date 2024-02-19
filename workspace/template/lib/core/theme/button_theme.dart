part of 'theme.dart';

class SabButtonTheme {
  const SabButtonTheme._();

  // TODO : 디자인 시스템 상 버튼 스타일로 세분화
  static ButtonStyle get textButton => TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      );

  static ButtonStyle get mainFilledButton => FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 15,
        ),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: SabColorTheme.black1,
        foregroundColor: SabColorTheme.white1,
        disabledBackgroundColor: SabColorTheme.black4,
        textStyle: SabTextTheme.basic.buttonMedium16,
      );

  static ButtonStyle get subOutlinedButton => OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 15,
        ),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: SabColorTheme.white1,
        foregroundColor: SabColorTheme.black1,
        textStyle: SabTextTheme.basic.buttonMedium16,
      );

  static ButtonStyle get iconButton => IconButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
}

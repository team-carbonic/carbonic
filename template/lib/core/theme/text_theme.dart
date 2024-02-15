part of 'theme.dart';

enum SabFontWeight {
  regular,
  medium,
  bold,
  ;

  FontWeight get value => switch (this) {
        regular => FontWeight.w400,
        medium => FontWeight.w500,
        bold => FontWeight.w700,
      };
}

class SabTextTheme {
  const SabTextTheme._();

  static const basic = _BasicTextTheme();
  static const semantic = _SemanticTextTheme();

  // TODO : 추후 신규 디자인으로 모든 페이지가 리뉴얼되면 제거 필요
  static SabTextStyle get legacyXL => const SabTextStyle(
        fontSize: 16.0,
      );
  static SabTextStyle get legacyL => const SabTextStyle(
        fontSize: 14.0,
      );
  static SabTextStyle get legacyM => const SabTextStyle(
        fontSize: 12.0,
      );
  static SabTextStyle get legacyS => const SabTextStyle(
        fontSize: 10.0,
      );
  static SabTextStyle get legacyXS => const SabTextStyle(
        fontSize: 8.0,
      );
}

/// 의미를 부여하여 일괄 관리하는 스타일 집합
class _SemanticTextTheme {
  const _SemanticTextTheme();

  SabTextStyle get button1 => SabTextStyle(
        fontSize: 16.0,
        fontWeight: SabFontWeight.medium.value,
      );

  TextStyle get appBarTitle1 => SabTextTheme.basic.pageMedium18.copyWith(
        color: SabColorTheme.black1,
      );
}

/// 의미를 부여하지 않고 일반적으로 사용되는 스타일 집합
class _BasicTextTheme {
  const _BasicTextTheme();

  SabTextStyle get pageBold36 => SabTextStyle(
        fontSize: 36.0,
        fontWeight: SabFontWeight.bold.value,
      );
  SabTextStyle get pageBold28 => SabTextStyle(
        fontSize: 28.0,
        fontWeight: SabFontWeight.bold.value,
      );
  SabTextStyle get pageBold24 => SabTextStyle(
        fontSize: 24.0,
        fontWeight: SabFontWeight.bold.value,
      );
  SabTextStyle get pageBold20 => SabTextStyle(
        fontSize: 20.0,
        fontWeight: SabFontWeight.bold.value,
      );
  SabTextStyle get pageBold16 => SabTextStyle(
        fontSize: 16.0,
        fontWeight: SabFontWeight.bold.value,
      );

  SabTextStyle get pageMedium24 => SabTextStyle(
        fontSize: 24.0,
        fontWeight: SabFontWeight.medium.value,
      );
  SabTextStyle get pageMedium20 => SabTextStyle(
        fontSize: 20.0,
        fontWeight: SabFontWeight.medium.value,
      );
  SabTextStyle get pageMedium18 => SabTextStyle(
        fontSize: 18.0,
        fontWeight: SabFontWeight.medium.value,
      );
  SabTextStyle get pageMedium16 => SabTextStyle(
        fontSize: 16.0,
        fontWeight: SabFontWeight.medium.value,
      );
  SabTextStyle get pageMedium14 => SabTextStyle(
        fontSize: 14.0,
        fontWeight: SabFontWeight.medium.value,
      );
  SabTextStyle get pageMedium12 => SabTextStyle(
        fontSize: 12.0,
        fontWeight: SabFontWeight.medium.value,
      );

  SabTextStyle get pageRegular16 => SabTextStyle(
        fontSize: 16.0,
        fontWeight: SabFontWeight.regular.value,
      );
  SabTextStyle get pageRegular14 => SabTextStyle(
        fontSize: 14.0,
        fontWeight: SabFontWeight.regular.value,
      );
  SabTextStyle get pageRegular12 => SabTextStyle(
        fontSize: 12.0,
        fontWeight: SabFontWeight.regular.value,
      );
  SabTextStyle get pageRegular11 => SabTextStyle(
        fontSize: 11.0,
        fontWeight: SabFontWeight.regular.value,
      );

  SabTextStyle get bottomSheetBold20 => SabTextStyle(
        fontSize: 20.0,
        fontWeight: SabFontWeight.bold.value,
      );
  SabTextStyle get bottomSheetMedium20 => SabTextStyle(
        fontSize: 20.0,
        fontWeight: SabFontWeight.medium.value,
      );
  SabTextStyle get bottomSheetMedium18 => SabTextStyle(
        fontSize: 18.0,
        fontWeight: SabFontWeight.medium.value,
      );
  SabTextStyle get bottomSheetMedium16 => SabTextStyle(
        fontSize: 16.0,
        fontWeight: SabFontWeight.medium.value,
      );
  SabTextStyle get bottomSheetRegular14 => SabTextStyle(
        fontSize: 14.0,
        fontWeight: SabFontWeight.regular.value,
      );
  SabTextStyle get bottomSheetRegular12 => SabTextStyle(
        fontSize: 12.0,
        fontWeight: SabFontWeight.regular.value,
      );

  SabTextStyle get dialogMedium16 => SabTextStyle(
        fontSize: 16.0,
        fontWeight: SabFontWeight.medium.value,
      );
  SabTextStyle get dialogRegular14 => SabTextStyle(
        fontSize: 14.0,
        fontWeight: SabFontWeight.regular.value,
      );

  SabTextStyle get buttonMedium16 => SabTextStyle(
        fontSize: 16.0,
        fontWeight: SabFontWeight.medium.value,
      );
}

/// [TextStyle]의 [copyWith] 등의 기능을 사용해야 하기 때문에 custom한 내용은 넣지 않는다.
/// 예를 들어, 0~1의 값을 갖는 [height]를 px 단위의 [lineHeight] 입력으로 대체하기 위해 사용한다.
class SabTextStyle extends TextStyle {
  final double? lineHeight;

  const SabTextStyle({
    this.lineHeight,
    required final double fontSize,
    super.fontWeight,
    super.inherit = true,
    super.color,
    super.backgroundColor,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.fontFamily,
    super.fontFamilyFallback,
    super.package,
    super.overflow,
  }) : super(
          fontSize: fontSize,
          height: lineHeight == null ? null : lineHeight / fontSize,
        );

  /// [color] 외의 요소를 사용하려면, 해당 기능을 추가해야 한다.
  /// [height]와 [package]는 사용하지 않는다.
  @override
  TextStyle copyWith({
    double? lineHeight,
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    ui.TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    List<ui.FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) =>
      SabTextStyle(
        lineHeight: lineHeight ?? this.lineHeight,
        fontSize: fontSize ?? this.fontSize!,
        fontWeight: fontWeight ?? this.fontWeight,
        inherit: inherit ?? this.inherit,
        color: color ?? this.color,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        fontStyle: fontStyle ?? this.fontStyle,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        wordSpacing: wordSpacing ?? this.wordSpacing,
        textBaseline: textBaseline ?? this.textBaseline,
        leadingDistribution: leadingDistribution ?? this.leadingDistribution,
        locale: locale ?? this.locale,
        foreground: foreground ?? this.foreground,
        background: background ?? this.background,
        shadows: shadows ?? this.shadows,
        fontFeatures: fontFeatures ?? this.fontFeatures,
        fontVariations: fontVariations ?? this.fontVariations,
        decoration: decoration ?? this.decoration,
        decorationColor: decorationColor ?? this.decorationColor,
        decorationStyle: decorationStyle ?? this.decorationStyle,
        decorationThickness: decorationThickness ?? this.decorationThickness,
        debugLabel: debugLabel ?? this.debugLabel,
        fontFamily: fontFamily ?? this.fontFamily,
        fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
        overflow: overflow ?? this.overflow,
      );
}

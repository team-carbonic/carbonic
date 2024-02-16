part of carbonic_ui_kit;

/// [separator]와 [spacing] 둘 중 하나만 사용이 가능하다.
class SpacedColumn extends StatelessWidget {
  final double? spacing;
  final EdgeInsets? padding;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  late final List<Widget> _children;
  final Widget? separator;

  SpacedColumn({
    super.key,
    required List<Widget> children,
    this.spacing,
    this.separator,
    this.padding,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
  })  : assert(
          spacing == null || separator == null,
          '[separator]와 [spacing] 둘 중 하나만 사용이 가능합니다.',
        ),
        assert(
          spacing == null || spacing > 0.0,
          'spacing은 0.0이상의 값이어야 합니다.',
        ) {
    if (children.length < 2 || (spacing == null && separator == null)) {
      _children = children;
    } else if (separator != null) {
      _children = List.generate(
        children.length * 2 - 1,
        (index) => index.isEven ? children[index ~/ 2] : separator!,
      );
    } else {
      _children = List.generate(
        children.length * 2 - 1,
        (index) => index.isEven ? children[index ~/ 2] : Gap(spacing ?? 0.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
          children: _children,
        ),
      );
}

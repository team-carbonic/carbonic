import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SpacedRow extends StatelessWidget {
  final double? spacing;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  late final List<Widget> _children;
  final Widget? separator;

  /// [separator]와 [spacing] 둘 중 하나만 사용이 가능하다.
  /// [mainAxisAlignment]는 [spacing]과 [separator]에도 적용되니 유의해야 한다.
  SpacedRow({
    super.key,
    required List<Widget> children,
    this.spacing,
    this.separator,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
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
        (index) => index.isEven ? children[index ~/ 2] : Gap(spacing ?? 0),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: _children,
      );
}

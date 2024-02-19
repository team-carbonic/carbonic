import 'package:flutter/material.dart';
import 'package:sotwo/core/theme/theme.dart';

class SabDialog<T> extends Page<T> {
  const SabDialog({
    super.key,
    this.barrierDismissible = true,
    this.useSafeArea = false,
    required this.child,
  }) : super(
          name: null,
          arguments: null,
          restorationId: null,
        );

  final bool barrierDismissible;
  final bool useSafeArea;
  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: (_) => _DialogWidget(child: child),
        anchorPoint: null,
        barrierColor: SabColorTheme.black1.withOpacity(0.4),
        barrierDismissible: barrierDismissible,
        barrierLabel: null,
        useSafeArea: useSafeArea,
        themes: null,
      );
}

class _DialogWidget extends StatelessWidget {
  const _DialogWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: child),
    );
  }
}

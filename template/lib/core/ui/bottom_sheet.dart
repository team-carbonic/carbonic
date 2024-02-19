import 'package:flutter/material.dart';
import 'package:sotwo/core/theme/theme.dart';
import 'package:sotwo/core/ui/container/spaced_row.dart';

class SabBottomSheet extends StatelessWidget {
  final String? title;
  final EdgeInsetsGeometry childPadding;
  final Widget? child;
  const SabBottomSheet._({
    super.key,
    this.title,
    required this.childPadding,
    this.child,
  });

  static Future<T?> showOneButton<T>(
    final BuildContext context, {
    final bool isBarrierDimmed = true,
    final bool isDismissible = false,
    final bool enableDrag = false,
    required final String title,
    required final String buttonText,
    required final VoidCallback onPressed,
  }) {
    return show<T>(
      context,
      isBarrierDimmed: isBarrierDimmed,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      title: title,
      child: FilledButton(
        style: SabButtonTheme.mainFilledButton,
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }

  static Future<T?> showTwoButtons<T>(
    final BuildContext context, {
    final bool isBarrierDimmed = true,
    final bool isDismissible = false,
    final bool enableDrag = false,
    required final String title,
    required final String mainButtonText,
    required final String subButtonText,
    required final VoidCallback onMainButtonPressed,
    required final VoidCallback onSubButtonPressed,
  }) {
    return show<T>(
      context,
      isBarrierDimmed: isBarrierDimmed,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      title: title,
      child: SpacedRow(
        spacing: 15.0,
        children: [
          Expanded(
            child: OutlinedButton(
              style: SabButtonTheme.subOutlinedButton,
              onPressed: onSubButtonPressed,
              child: Text(subButtonText),
            ),
          ),
          Expanded(
            child: FilledButton(
              style: SabButtonTheme.mainFilledButton,
              onPressed: onMainButtonPressed,
              child: Text(mainButtonText),
            ),
          ),
        ],
      ),
    );
  }

  static Future<T?> show<T>(
    final BuildContext context, {
    final bool isBarrierDimmed = true,
    final bool isDismissible = false,
    final bool enableDrag = false,
    final String? title,
    final EdgeInsets childPadding = const EdgeInsets.all(15.0),
    required final Widget child,
  }) {
    return showModalBottomSheet<T>(
      elevation: 0,
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      isDismissible: isDismissible,
      useSafeArea: true,
      enableDrag: enableDrag,
      barrierColor:
          isBarrierDimmed ? SabColorTheme.black1.withOpacity(0.4) : null,
      clipBehavior: Clip.antiAlias,
      barrierLabel: 'Dismiss',
      backgroundColor: SabColorTheme.white1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      constraints: null,
      showDragHandle: null,
      transitionAnimationController: null,
      anchorPoint: null,
      builder: (_) => SabBottomSheet._(
        title: title,
        childPadding: childPadding,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 15.0,
                  ),
                  child: Text(
                    title!,
                    style: SabTextTheme.basic.bottomSheetBold20.copyWith(
                      color: SabColorTheme.black1,
                    ),
                  ),
                ),
              Padding(
                padding: childPadding,
                child: child,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

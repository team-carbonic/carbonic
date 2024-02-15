import 'package:flutter/material.dart';
import 'package:sotwo/core/theme/theme.dart';

class SabBottomSheet<T> extends Page<T> {
  final bool isDismissible;
  final bool useSafeArea;
  final String? title;
  final EdgeInsetsGeometry childPadding;
  final Widget child;

  const SabBottomSheet({
    super.key,
    this.isDismissible = true,
    this.useSafeArea = true,
    this.title,
    this.childPadding = const EdgeInsets.all(15.0),
    required this.child,
  }) : super(
          name: null,
          arguments: null,
          restorationId: null,
        );

  factory SabBottomSheet.oneButton({
    required final String title,
    required final String buttonText,
    required final VoidCallback onButtonTap,
  }) =>
      SabBottomSheet(
        title: title,
        child: FilledButton(
          onPressed: onButtonTap,
          style: SabButtonTheme.mainFilledButton,
          child: Text(buttonText),
        ),
      );

  factory SabBottomSheet.twoButtons({
    required final String title,
    required final String buttonText,
    required final VoidCallback onButtonTap,
  }) =>
      SabBottomSheet(
        title: title,
        child: FilledButton(
          onPressed: onButtonTap,
          style: SabButtonTheme.mainFilledButton,
          child: Text(buttonText),
        ),
      );

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        settings: this,
        builder: (_) => Wrap(
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
        capturedThemes: null,
        barrierLabel: 'Dismiss',
        barrierOnTapHint: null,
        backgroundColor: SabColorTheme.white1,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        clipBehavior: null,
        constraints: null,
        modalBarrierColor: SabColorTheme.black1.withOpacity(0.4),
        isDismissible: isDismissible,
        enableDrag: true,
        showDragHandle: null,
        isScrollControlled: true, // 동적인 높이 대응을 위함
        transitionAnimationController: null,
        anchorPoint: null,
        useSafeArea: useSafeArea,
      );
}

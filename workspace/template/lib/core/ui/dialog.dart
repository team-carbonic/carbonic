import 'package:flutter/material.dart';
import 'package:sotwo/core/ui/gesture_detector.dart';

class SabDialog extends StatelessWidget {
  final Widget child;
  const SabDialog._({
    super.key,
    required this.child,
  });

  static Future<T?> showOneButton<T>({
    required final BuildContext context,
    final bool barrierDismissible = false,
    required final String mainText,
    final String? subText,
    required final VoidCallback onPressed,
    required final String buttonText,
  }) =>
      show<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        child: _OneButtonTemplate(
          mainText: mainText,
          subText: subText,
          onPressed: onPressed,
          buttonText: buttonText,
        ),
      );

  static Future<T?> show<T>({
    required final BuildContext context,
    final bool barrierDimmed = true,
    final bool barrierDismissible = false,
    required final Widget child,
  }) {
    return showDialog<T>(
      context: context,
      useSafeArea: true,
      barrierDismissible: barrierDismissible,
      barrierColor:
          barrierDimmed ? Colors.black.withOpacity(0.5) : Colors.transparent,
      builder: (_) => SabDialog._(
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: child,
      ),
    );
  }
}

class _OneButtonTemplate extends StatelessWidget {
  final String mainText;
  final String? subText;
  final VoidCallback onPressed;
  final String buttonText;
  const _OneButtonTemplate({
    super.key,
    required this.mainText,
    this.subText,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 15.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mainText,
                  textAlign: TextAlign.center,
                ),
                if (subText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      subText!,
                    ),
                  ),
              ],
            ),
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
            color: Color.fromRGBO(224, 224, 224, 1.0),
          ),
          SabGestureDetector(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    buttonText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

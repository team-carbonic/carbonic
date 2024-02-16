import 'dart:async';

import 'package:flutter/material.dart';

const showHitBox = false;

/// [width], [height], [innerPadding]은 터치 영역을 조절하기 위해 사용한다.
class CbGestureDetector extends StatefulWidget {
  final HitTestBehavior? behavior;
  final void Function()? onTap;
  final void Function()? onClicked;
  final void Function()? onLongPress;
  final void Function()? onLongPressing;
  final Duration longPressingEventPeriod;
  final void Function()? onSwipeToLeft;
  final void Function()? onSwipeToRight;
  final void Function()? onTapCancel;
  final void Function(TapDownDetails details)? onTapDown;
  final void Function(TapUpDetails details)? onTapUp;
  final void Function(DragStartDetails)? onVerticalDragStart;
  final double? width;
  final double? height;
  final EdgeInsets? innerPadding;
  final AlignmentGeometry? alignment;
  final Widget child;

  /// [behavior]를 기본 [HitTestBehavior.opaque]로 설정해준다.
  /// Hit 영역 표시 디버깅을 위한 기능을 포함하고 있다.
  /// [onLongPress]와 [onLongPressing]은 상호 배타적이다.
  const CbGestureDetector({
    super.key,
    this.behavior,
    this.onTap,
    this.onClicked,
    this.onLongPress,
    this.onLongPressing,
    this.longPressingEventPeriod = const Duration(milliseconds: 200),
    this.onSwipeToLeft,
    this.onSwipeToRight,
    this.onVerticalDragStart,
    required this.child,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.width,
    this.height,
    this.innerPadding,
    this.alignment,
  }) : assert(onLongPress == null || onLongPressing == null);

  @override
  State<CbGestureDetector> createState() => _CbGestureDetectorState();
}

class _CbGestureDetectorState extends State<CbGestureDetector> {
  bool longPressing = false;
  bool tapped = false;
  late final GlobalKey key;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    key = GlobalKey();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget get childWithTouchArea => SizedBox(
        width: widget.width,
        height: widget.height,
        child: Padding(
          padding: widget.innerPadding ?? EdgeInsets.zero,
          child: widget.alignment != null
              ? Align(
                  alignment: widget.alignment!,
                  child: widget.child,
                )
              : widget.child,
        ),
      );

  @override
  Widget build(BuildContext context) {
    Size? size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
      size = renderBox?.size;
    });

    final component = _HorizontalSwipeDetectorComponent(
      onSwipeToLeft: widget.onSwipeToLeft,
      onSwipeToRight: widget.onSwipeToRight,
    );

    return GestureDetector(
      key: key,
      behavior: widget.behavior ?? HitTestBehavior.opaque,
      onTap: widget.onTap,
      onLongPressStart: (details) {
        tapped = false;

        if (widget.onLongPressing != null) {
          longPressing = true;

          timer?.cancel();
          timer = Timer.periodic(
            widget.longPressingEventPeriod,
            (_) {
              widget.onLongPressing?.call();
            },
          );
        }
      },
      onLongPressEnd: (details) {
        if (longPressing) {
          longPressing = false;
          timer?.cancel();
        }
      },
      onLongPress: widget.onLongPress,
      onLongPressMoveUpdate: (details) {
        final localPosition = details.localPosition;

        final left = localPosition.dx < 0 ||
            (size?.width ?? 0) < localPosition.dx ||
            localPosition.dy < 0 ||
            (size?.height ?? 0) < localPosition.dy;

        if (left) {
          if (longPressing) {
            longPressing = false;
            timer?.cancel();
          }
        }
      },
      onTapDown: (details) {
        tapped = true;
        widget.onTapDown?.call(details);
      },
      onTapUp: (details) {
        if (tapped) {
          tapped = false;
          widget.onClicked?.call();
        }
        widget.onTapUp?.call(details);
      },
      onTapCancel: () {
        widget.onTapCancel?.call();
      },
      onHorizontalDragStart:
          widget.onSwipeToLeft != null || widget.onSwipeToRight != null
              ? component._onHorizontalDragStart
              : null,
      onHorizontalDragUpdate:
          widget.onSwipeToLeft != null || widget.onSwipeToRight != null
              ? component._onHorizontalDragUpdate
              : null,
      onHorizontalDragEnd:
          widget.onSwipeToLeft != null || widget.onSwipeToRight != null
              ? component._onHorizontalDragEnd
              : null,
      onVerticalDragStart: widget.onVerticalDragStart,
      child: showHitBox
          ? Stack(
              alignment: Alignment.center,
              children: [
                childWithTouchArea,
                Positioned.fill(
                  child: Container(
                    color: Colors.red.withOpacity(0.3),
                  ),
                ),
              ],
            )
          : childWithTouchArea,
    );
  }
}

class _HorizontalSwipeDetectorComponent {
  Offset? _initialSwipeOffset;
  Offset? _finalSwipeOffset;
  SwipeDirection? _previousDirection;
  SimpleSwipeConfig swipeConfig = const SimpleSwipeConfig();

  final void Function()? onSwipeToLeft;
  final void Function()? onSwipeToRight;

  _HorizontalSwipeDetectorComponent({
    this.onSwipeToLeft,
    this.onSwipeToRight,
  });

  void _onHorizontalDragStart(final DragStartDetails details) {
    _initialSwipeOffset = details.globalPosition;
  }

  void _onHorizontalDragUpdate(final DragUpdateDetails details) {
    _finalSwipeOffset = details.globalPosition;
    if (swipeConfig.swipeDetectionBehavior ==
        SwipeDetectionBehavior.singularOnEnd) {
      return;
    }

    final initialOffset = _initialSwipeOffset;
    final finalOffset = _finalSwipeOffset;

    if (initialOffset != null && finalOffset != null) {
      final offsetDifference = initialOffset.dx - finalOffset.dx;

      if (offsetDifference.abs() > swipeConfig.horizontalThreshold) {
        _initialSwipeOffset = swipeConfig.swipeDetectionBehavior ==
                SwipeDetectionBehavior.singular
            ? null
            : _finalSwipeOffset;

        final direction =
            offsetDifference > 0 ? SwipeDirection.left : SwipeDirection.right;

        if (swipeConfig.swipeDetectionBehavior ==
                SwipeDetectionBehavior.continuous ||
            _previousDirection == null ||
            direction != _previousDirection) {
          _previousDirection = direction;
        }
      }
    }
  }

  void _onHorizontalDragEnd(final DragEndDetails details) {
    if (swipeConfig.swipeDetectionBehavior ==
        SwipeDetectionBehavior.singularOnEnd) {
      final initialOffset = _initialSwipeOffset;
      final finalOffset = _finalSwipeOffset;

      if (initialOffset != null && finalOffset != null) {
        final offsetDifference = initialOffset.dx - finalOffset.dx;

        if (offsetDifference.abs() > swipeConfig.horizontalThreshold) {
          final direction =
              offsetDifference > 0 ? SwipeDirection.left : SwipeDirection.right;
          if (direction == SwipeDirection.left) {
            onSwipeToLeft?.call();
          } else {
            onSwipeToRight?.call();
          }
        }
      }
    }

    _initialSwipeOffset = null;
    _previousDirection = null;
  }
}

class SimpleSwipeConfig {
  final double verticalThreshold;
  final double horizontalThreshold;
  final SwipeDetectionBehavior swipeDetectionBehavior;

  const SimpleSwipeConfig({
    this.verticalThreshold = 50.0,
    this.horizontalThreshold = 50.0,
    this.swipeDetectionBehavior = SwipeDetectionBehavior.singularOnEnd,
  });
}

enum SwipeDetectionBehavior {
  singular,
  singularOnEnd,
  continuous,
  continuousDistinct,
}

enum SwipeDirection { left, right, up, down }

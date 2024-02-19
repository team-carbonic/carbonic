import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class PullToRefresh extends StatelessWidget {
  final int notificationDepth;
  final double iconOffset;
  final double screenOffset;
  final Color? backgroundColor;
  final Future<void> Function() onRefresh;
  final Widget child;
  const PullToRefresh({
    super.key,
    this.notificationDepth = 0,
    this.iconOffset = 35,
    this.screenOffset = 100,
    this.backgroundColor,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      notificationPredicate: (notification) =>
          notification.depth == notificationDepth,
      durations: const RefreshIndicatorDurations(
        completeDuration: Duration(milliseconds: 1700),
      ),
      onRefresh: onRefresh,
      builder: (context, child, controller) => Stack(
        alignment: Alignment.topCenter,
        children: [
          if (!controller.isIdle && backgroundColor != null)
            Container(
              color: backgroundColor,
              width: double.infinity,
              height: screenOffset * controller.value,
            ),
          if (!controller.isIdle)
            Positioned(
              top: iconOffset * controller.value,
              // TODO : 로딩 애니메이션 결정되면 수정 필요
              child: Container(
                color: Colors.lightBlue,
                child: const Text('로딩 중'),
              ),
            ),
          Transform.translate(
            offset: Offset(
              0,
              screenOffset * controller.value,
            ),
            child: child,
          ),
        ],
      ),
      child: child,
    );
  }
}

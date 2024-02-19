import 'package:flutter/material.dart';

class LifeCycleHandler extends StatefulWidget {
  final VoidCallback? onResumed;
  final VoidCallback? onPaused;
  final VoidCallback? onStopped;
  final VoidCallback? onDetached;
  final VoidCallback? onInactive;

  final Widget child;
  const LifeCycleHandler({
    super.key,
    this.onResumed,
    this.onPaused,
    this.onStopped,
    this.onDetached,
    this.onInactive,
    required this.child,
  });

  @override
  State<LifeCycleHandler> createState() => _LifeCycleHandlerState();
}

class _LifeCycleHandlerState extends State<LifeCycleHandler>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.onResumed?.call();
      case AppLifecycleState.inactive:
        widget.onInactive?.call();
      case AppLifecycleState.paused:
        widget.onPaused?.call();
      case AppLifecycleState.detached:
        widget.onDetached?.call();
      case AppLifecycleState.hidden:
        widget.onStopped?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

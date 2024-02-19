// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sotwo/feature/route/router.dart';

class FullScreenLoadingIndicator {
  const FullScreenLoadingIndicator._();

  static FutureOr<T?> show<T>(
    final BuildContext context,
    final FutureOr<T?> Function() func,
  ) async {
    if (!context.mounted || context.loaderOverlay.visible) {
      return null;
    }

    T? result;
    try {
      context.loaderOverlay.show();

      result = await func();
      _hide(context);
    } catch (_) {
      _hide(context);
      rethrow;
    }
    return result;
  }

  static void _hide(final BuildContext context) {
    try {
      if (!context.mounted) {
        throw Exception();
      }
      context.loaderOverlay.hide();
    } catch (_) {
      rootNavigatorKey.currentContext?.loaderOverlay.hide();
    }
  }
}

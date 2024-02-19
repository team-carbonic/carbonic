import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sotwo/core/ui/security_keypad/api.g.dart';
import 'package:sotwo/core/utility/call_wrapper.dart';
import 'package:sotwo/core/utility/logger/core/core.dart';
import 'package:sotwo/core/utility/logger/logger.dart';

part 'controller.dart';

enum SecurityKeypadType {
  password(4),
  residentNumber(13),
  ;

  final int maxInputLength;
  const SecurityKeypadType(this.maxInputLength);
}

class SecurityKeypad extends StatefulWidget {
  final SecurityKeypadType type;
  final SecurityKeypadController controller;

  const SecurityKeypad({
    super.key,
    required this.type,
    required this.controller,
  });

  @override
  State<SecurityKeypad> createState() => _SecurityKeypadState();
}

class _SecurityKeypadState extends State<SecurityKeypad>
    implements SecurityKeypadFlutterApi {
  @override
  void initState() {
    super.initState();
    SecurityKeypadFlutterApi.setup(this);
  }

  @override
  void dispose() {
    SecurityKeypadFlutterApi.setup(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: Platform.isIOS,
      onPopInvoked: (didPop) async {
        if (!didPop && Platform.isAndroid) {
          if (widget.controller._isOpened.value) {
            await Throttler.processAsync(
              hashCode,
              () => SecurityKeypadHostApi().hide(),
            );
            return;
          }
        }
        context.pop();
      },
      child: ValueListenableBuilder(
        valueListenable: widget.controller._isOpened,
        builder: (_, __, ___) => widget.controller._isOpened.value
            ? Platform.isAndroid
                ? _HostingAndroidView(
                    type: widget.type,
                  )
                : _HostingIosView(
                    type: widget.type,
                  )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  void onHostFocusLost() {
    widget.controller._isOpened.value = false;
  }

  @override
  void onInputLengthChanged(final int length) {
    widget.controller.inputLength.value = length;
  }

  @override
  void onInputCompleted(final String? encryptedInput) {
    Logger.info(
      content: 'encryptedInput: $encryptedInput',
      title: 'KbKeypad',
      category: LogCategory.securityKeypad,
    );
    widget.controller.encryptedInput.value = encryptedInput ?? '';
    widget.controller._isOpened.value = false;
  }
}

class _HostingAndroidView extends StatefulWidget {
  final SecurityKeypadType type;

  const _HostingAndroidView({
    super.key,
    required this.type,
  });

  @override
  State<_HostingAndroidView> createState() => _HostingAndroidViewState();
}

class _HostingAndroidViewState extends State<_HostingAndroidView> {
  AndroidViewController? _androidViewController;

  @override
  void dispose() {
    _androidViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: widget.type.name,
      surfaceFactory: (context, controller) {
        _androidViewController = controller as AndroidViewController;
        return AndroidViewSurface(
          controller: _androidViewController!,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (params) =>
          PlatformViewsService.initSurfaceAndroidView(
        id: params.id,
        viewType: widget.type.name,
        layoutDirection: TextDirection.ltr,
        creationParams: {
          'viewType': widget.type.name,
        },
        creationParamsCodec: const StandardMessageCodec(),
        onFocus: () {
          params.onFocusChanged(true);
        },
      )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..create(),
    );
  }
}

class _HostingIosView extends StatelessWidget {
  final SecurityKeypadType type;

  const _HostingIosView({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: type.name,
      creationParams: {
        'viewType': type.name,
      },
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}

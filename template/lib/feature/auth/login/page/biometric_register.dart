import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotwo/core/utility/call_wrapper.dart';
import 'package:sotwo/feature/auth/login/biometric_manager.dart';
import 'package:sotwo/feature/auth/login/page/biometric_template.dart';
import 'package:sotwo/feature/route/route.dart';

class BiometricRegisterPageRoutingInfo extends RoutingInfo {
  final SabRoute routeOnSuccess;
  final SabRoute routeOnFail;

  const BiometricRegisterPageRoutingInfo({
    required this.routeOnSuccess,
    required this.routeOnFail,
  });
}

class BiometricRegisterPage extends ConsumerStatefulWidget {
  final BiometricRegisterPageRoutingInfo routingInfo;
  const BiometricRegisterPage(
    this.routingInfo, {
    super.key,
  });

  @override
  ConsumerState<BiometricRegisterPage> createState() =>
      _BiometricRegisterPageState();
}

class _BiometricRegisterPageState extends ConsumerState<BiometricRegisterPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authenticate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const BiometricTemplate();
  }

  Future<void> _authenticate() async {
    final succeeded = await BiometricManager.authenticate();
    if (!context.mounted) {
      return;
    }

    if (succeeded) {
      BiometricManager.showRegistrationSuccessBottomSheet(
        context,
        onPressed: () => Throttler.processSync(
          hashCode,
          () => widget.routingInfo.routeOnSuccess.go(context),
        ),
      );
    } else {
      BiometricManager.showRegistrationFailBottomSheet(
        context,
        onPressed: () => Throttler.processSync(
          hashCode,
          () => widget.routingInfo.routeOnFail.go(context),
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:sotwo/core/utility/cast.dart';
import 'package:sotwo/core/utility/logger/logger.dart';
import 'package:sotwo/feature/auth/core/page/mobile_carrier.dart';
import 'package:sotwo/feature/route/route.dart';

class GwjTestPage extends StatelessWidget {
  const GwjTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => SabRoute.testGwjSecurityKeypad.go(context),
              child: const Text('KB Keypad'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result =
                    await SabRoute.mobileCarrierBottomSheet.push(context);
                final carrierType = cast<MobileCarrierType>(result);
                if (carrierType == null) {
                  return;
                }
                Logger.test(
                  content: 'MobileCarrierType: ${carrierType.text}',
                );
              },
              child: const Text('Mobile Carrier Bottom Sheet'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await SabRoute.termsBottomSheet.push(context);
                final resultTypes = cast<Set>(result);
                if (resultTypes == null) {
                  return;
                }
                Logger.test(
                  content: 'Terms: $resultTypes',
                );
              },
              child: const Text('Terms Bottom Sheet'),
            ),
            ElevatedButton(
              onPressed: () => SabRoute.testGwjDialog.go(context),
              child: const Text('dialog'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sotwo/core/theme/design_constant.dart';
import 'package:sotwo/core/theme/theme.dart';

class BiometricTemplate extends StatelessWidget {
  const BiometricTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 65.0,
              horizontal: DesignConstant.pageDefaultHorizontalPadding,
            ),
            child: Text(
              '생체인증을 통해\n간편하게 로그인하세요',
              style: SabTextTheme.basic.pageBold28.copyWith(
                color: SabColorTheme.black1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:sotwo/core/theme/design_constant.dart';
import 'package:sotwo/core/theme/theme.dart';
import 'package:sotwo/core/utility/layout_function_library.dart';
import 'package:sotwo/feature/route/route.dart';

class OnboardingTemplatePage extends StatelessWidget {
  final String title;
  final List<(String text, bool highlighted)> description;
  final SabRoute nextRoute;
  const OnboardingTemplatePage({
    super.key,
    required this.title,
    required this.description,
    required this.nextRoute,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: LayoutFunctionLibrary.getProportionalHeight(
                context,
                80.0,
              ),
              left: DesignConstant.pageDefaultHorizontalPadding,
              right: DesignConstant.pageDefaultHorizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: SabTextTheme.basic.pageBold36.copyWith(
                    color: SabColorTheme.black1,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const Gap(45.0),
                Text.rich(
                  TextSpan(
                    children: description.map(
                      (e) {
                        return TextSpan(
                          text: e.$1,
                          style: SabTextTheme.basic.pageRegular16.copyWith(
                            color: e.$2
                                ? SabColorTheme.black2
                                : SabColorTheme.blue1,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ).animate(
                  onComplete: (_) {
                    Future.delayed(
                      2500.ms,
                      () {
                        if (context.mounted) {
                          nextRoute.go(context);
                        }
                      },
                    );
                  },
                ).fadeIn(delay: 600.ms, duration: 600.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

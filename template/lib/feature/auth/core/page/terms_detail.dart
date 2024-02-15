import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:go_router/go_router.dart';
import 'package:sotwo/core/theme/theme.dart';
import 'package:sotwo/core/utility/time/time.dart';
import 'package:sotwo/feature/auth/core/page/terms.dart';
import 'package:sotwo/feature/route/route.dart';

class TermsDetailPageRoutingInfo extends RoutingInfo {
  const TermsDetailPageRoutingInfo({
    required this.type,
    required this.htmlContent,
    required this.createdTime,
    this.updatedTime,
  });

  final TermsType type;
  final String htmlContent;
  final SabDateTime createdTime;
  final SabDateTime? updatedTime;
}

class TermsDetailPage extends StatelessWidget {
  const TermsDetailPage({
    super.key,
    required this.routingInfo,
  });

  final TermsDetailPageRoutingInfo routingInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routingInfo.type.text),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: HtmlWidget(routingInfo.htmlContent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              // TODO : 디자인 시스템 상 버튼으로 변경
              child: FilledButton(
                style: SabButtonTheme.mainFilledButton,
                onPressed: () => context.pop(true),
                child: const Text(
                  '동의',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

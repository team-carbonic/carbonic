import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sotwo/core/theme/design_constant.dart';
import 'package:sotwo/core/ui/container/spaced_column.dart';
import 'package:sotwo/core/ui/gesture_detector.dart';
import 'package:sotwo/core/utility/call_wrapper.dart';
import 'package:sotwo/core/utility/cast.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenSourceLicensePage extends StatelessWidget {
  const OpenSourceLicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('오픈 소스 라이선스'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: DesignConstant.pageDefaultHorizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('오픈소스 라이선스 목록입니다'),
                const Divider(),
                FutureBuilder(
                  future: rootBundle.loadString(
                    'asset/feature/open_source_license/list.json',
                  ),
                  builder: (context, snapshot) {
                    final data = cast<List>(
                      jsonDecode(
                        snapshot.data.toString(),
                      ),
                    );
                    if (data == null) {
                      return const SizedBox.shrink();
                    }

                    if (data.isEmpty) {
                      return const Text('사용 중인 오픈소스가 없습니다');
                    }

                    return SpacedColumn(
                      spacing: 15.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data.map((e) {
                        final openSource = e as Map;

                        final licenseUrl = openSource['licenseUrl'] as String;
                        final packageUrl =
                            (licenseUrl.split('/')..removeLast()).join('/');

                        return SabGestureDetector(
                          onTap: () => Throttler.processSync(
                            hashCode,
                            () {
                              launchUrl(Uri.parse(licenseUrl));
                            },
                          ),
                          child: SpacedColumn(
                            spacing: 2.0,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                '[${openSource['packageName']}]',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(packageUrl),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

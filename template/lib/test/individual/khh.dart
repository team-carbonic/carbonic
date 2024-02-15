import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sotwo/core/network/dio_client.dart';
import 'package:sotwo/core/security/program.dart';
import 'package:sotwo/core/ui/full_screen_loading_indicator.dart';
import 'package:sotwo/core/utility/logger/logger.dart';
import 'package:sotwo/feature/route/route.dart';

class KhhTestPage extends StatefulWidget {
  const KhhTestPage({super.key});

  @override
  State<KhhTestPage> createState() => _KhhTestPageState();
}

class _KhhTestPageState extends State<KhhTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SabRoute.initialVisitOnboarding.push(context);
              },
              child: const Text('라우팅 테스트'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await DioClient(
                  headerType: HeaderType.json,
                ).get(
                  '/v1/faqs',
                  options: Options(
                    headers: {
                      'Content-Type': 'application/json; charset=utf-8',
                    },
                  ),
                );

                Logger.info(content: result.toString());
              },
              child: const Text('faq request test'),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  throw Exception('exception test!');
                } catch (e, s) {
                  Logger.error(
                    title: 'exception test',
                    exception: e,
                    stackTrace: s,
                  );
                }
              },
              child: const Text('예외 발생 Logger -> Sentry 테스트'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed('khhTestPage2');
              },
              child: const Text('한 뎁스 더 들어가기'),
            ),
            ElevatedButton(
              onPressed: () {
                SecurityProgram().start();
              },
              child: const Text('V-Guard 시작'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed('zoom');
              },
              child: const Text('zoom으로 go'),
            ),
            ElevatedButton(
              onPressed: () async {
                await FullScreenLoadingIndicator.show(context, () async {
                  context.pop();
                  await Future.delayed(const Duration(seconds: 3));
                });

                await FullScreenLoadingIndicator.show(context, () async {
                  context.pop();
                  await Future.delayed(const Duration(seconds: 3));
                });

                if (context.mounted) {
                  context.goNamed('zoom');
                }
              },
              child: const Text('overlay 후 zoom go'),
            ),
          ],
        ),
      ),
    );
  }
}

class KhhTestPageRoutingInfo extends RoutingInfo {
  final String data;
  const KhhTestPageRoutingInfo({
    required this.data,
  });

  static KhhTestPageRoutingInfo fromQueryParameters(
    final Map<String, String> queryParameters,
  ) {
    return KhhTestPageRoutingInfo(
      data: queryParameters['data']!,
    );
  }
}

class KhhTestPageWithRoutingInfo extends StatelessWidget {
  final KhhTestPageRoutingInfo info;
  const KhhTestPageWithRoutingInfo(this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('routing info test, ${info.data}'),
      ),
    );
  }
}

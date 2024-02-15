import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:sotwo/core/theme/svg/main.dart';
import 'package:sotwo/core/theme/theme.dart';
import 'package:sotwo/core/ui/container/spaced_column.dart';
import 'package:sotwo/core/ui/container/spaced_row.dart';
import 'package:sotwo/core/ui/gesture_detector.dart';
import 'package:sotwo/core/utility/call_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

const _mailAddress = 'help@sotwo.com';
const _phoneNumber = '02-514-2505';

class CustomerServiceInformation extends StatelessWidget {
  const CustomerServiceInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpacedColumn(
          spacing: 10.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InformationRow(
              data: _mailAddress,
              onTap: () => Throttler.processSync(
                hashCode,
                () {
                  FlutterEmailSender.send(
                    Email(
                      recipients: [_mailAddress],
                    ),
                  );
                },
              ),
            ),
            _InformationRow(
              data: _phoneNumber,
              onTap: () => Throttler.processSync(
                hashCode,
                () {
                  launchUrl(Uri.parse('tel://$_phoneNumber'));
                },
              ),
            ),
            const _InformationRow(
              data: '평일 10:00~12:00 / 13:00~17:00',
            ),
            const _InformationRow(
              data: '토/일, 공휴일 휴무',
            ),
          ],
        ),
        const Text(
          '문의가 많을 경우 전화 연결이 지연될 수 있습니다.\n메일로 문의사항을 보내주시면 순차적으로 답변을 드리겠습니다.\n감사합니다.',
        ),
      ],
    );
  }
}

class _InformationRow extends StatelessWidget {
  final String data;
  final void Function()? onTap;
  const _InformationRow({
    super.key,
    required this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SabGestureDetector(
      onTap: onTap,
      child: SpacedRow(
        spacing: 5.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SabSvg(SvgData.test),
          Text(
            data,
            style: context.theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sotwo/core/theme/svg/main.dart';
import 'package:sotwo/core/theme/theme.dart';
import 'package:sotwo/core/ui/container/spaced_column.dart';
import 'package:sotwo/core/ui/container/spaced_row.dart';
import 'package:sotwo/core/ui/gesture_detector.dart';
import 'package:sotwo/core/utility/call_wrapper.dart';
import 'package:sotwo/feature/common/widget/customer_service_information.dart';
import 'package:sotwo/feature/route/route.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '더보기',
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            child: SpacedColumn(
              spacing: 40.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacedColumn(
                  spacing: 40.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _MenuListSection(
                      title: '내정보',
                      items: [
                        _MenuListItem(
                          icon: SvgData.test,
                          title: '계정 정보 관리',
                          onTap: () {},
                        ),
                      ],
                    ),
                    _MenuListSection(
                      title: '알아보기',
                      items: [
                        _MenuListItem(
                          icon: SvgData.test,
                          title: '계정 정보 관리',
                          onTap: () {},
                        ),
                        _MenuListItem(
                          icon: SvgData.test,
                          title: '공지사항',
                          onTap: () => SabRoute.announcement.go(context),
                        ),
                        _MenuListItem(
                          icon: SvgData.test,
                          title: '이벤트 (테스트)',
                          onTap: () => SabRoute.event.go(context),
                        ),
                        _MenuListItem(
                          icon: SvgData.test,
                          title: 'FAQ',
                          onTap: () {},
                        ),
                      ],
                    ),
                    _MenuListSection(
                      title: '설정',
                      items: [
                        _MenuListItem(
                          icon: SvgData.test,
                          title: '알림',
                          onTap: () {},
                        ),
                        _MenuListItem(
                          icon: SvgData.test,
                          title: '보안',
                          onTap: () {},
                        ),
                        _MenuListItem(
                          icon: SvgData.test,
                          title: '버전정보',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.1,
                      ),
                    ),
                  ),
                  child: SpacedColumn(
                    spacing: 10.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '고객지원',
                        style: SabTextTheme.legacyL,
                      ),
                      const CustomerServiceInformation(),
                    ],
                  ),
                ),
                SabGestureDetector(
                  onTap: () => Throttler.processSync(
                    hashCode,
                    () {
                      // TODO : 약관 및 정책 페이지로 이동하고 openSourceLicense 이동은 그 안에서 수행할 것
                      SabRoute.openSourceLicense.go(context);
                    },
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '약관 및 정책',
                        style: SabTextTheme.legacyL,
                      ),
                      const SabSvg(SvgData.test),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuListSection extends StatelessWidget {
  final String title;
  final List<_MenuListItem> items;
  const _MenuListSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      spacing: 10.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: SabTextTheme.legacyL,
        ),
        Column(
          children: items,
        ),
      ],
    );
  }
}

class _MenuListItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const _MenuListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SabGestureDetector(
      onTap: () => Throttler.processSync(hashCode, onTap),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SpacedRow(
              spacing: 5.0,
              children: [
                SabSvg(icon),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            SabSvg(icon),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:sotwo/core/theme/theme.dart';
import 'package:sotwo/core/ui/container/spaced_column.dart';
import 'package:sotwo/core/ui/pull_to_refresh.dart';
import 'package:sotwo/core/utility/time/time.dart';
import 'package:sotwo/feature/announcement/model/list.dart';
import 'package:sotwo/feature/announcement/provider/list.dart';
import 'package:sotwo/feature/announcement/ui/page/detail.dart';
import 'package:sotwo/feature/route/route.dart';

class AnnouncementListPage extends ConsumerStatefulWidget {
  const AnnouncementListPage({super.key});

  @override
  ConsumerState<AnnouncementListPage> createState() =>
      _AnnouncementListPageState();
}

class _AnnouncementListPageState extends ConsumerState<AnnouncementListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항'),
      ),
      body: SafeArea(
        child: PullToRefresh(
          onRefresh: () async => ref.invalidate(announcementListProvider),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Consumer(
              builder: (_, ref, __) {
                final asyncData = ref.watch(announcementListProvider);
                return asyncData.when(
                  data: (data) => _OnData(data: data),
                  loading: () => const _OnLoading(),
                  error: (_, __) => const _OnError(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    final totalElementCount =
        ref.read(announcementListProvider).value?.announcementDetails.length;
    if (totalElementCount == null || totalElementCount == 0) {
      return;
    }

    final scrollRatio =
        ((totalElementCount - AnnouncementList.pageSize) / totalElementCount)
            .clamp(0, 1);
    if (_scrollController.position.maxScrollExtent * scrollRatio <=
        _scrollController.offset) {
      ref.read(announcementListProvider.notifier).fetchMore();
    }
  }
}

class _Element extends StatelessWidget {
  const _Element({
    super.key,
    required this.id,
    required this.title,
    required this.date,
  });

  final int id;
  final String title;
  final SabDateTime date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => SabRoute.announcementDetail.go(
        context,
        AnnouncementDetailPageRoutingInfo(id: id),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: SabTextTheme.legacyL,
            ),
            const Gap(8),
            Text(
              date.yearToDay1,
              style: SabTextTheme.legacyM.copyWith(
                color: SabColorTheme.black3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnData extends StatelessWidget {
  const _OnData({
    super.key,
    required this.data,
  });

  final AnnouncementListModel data;

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      separator: const Divider(
        height: 1,
        thickness: 1,
        color: SabColorTheme.black6,
      ),
      children: [
        for (final detailData in data.announcementDetails)
          _Element(
            id: detailData.id,
            title: detailData.title,
            date: detailData.time,
          ),
      ],
    );
  }
}

// TODO: 로딩 인디케이터 애니메이션 결정되면 수정 필요
class _OnLoading extends StatelessWidget {
  const _OnLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.lightBlue,
        child: const Text('로딩 중'),
      ),
    );
  }
}

// TODO: 로딩 에러 연출이 결정되면 수정 필요
class _OnError extends StatelessWidget {
  const _OnError({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.red,
        child: const Text('로딩 에러'),
      ),
    );
  }
}

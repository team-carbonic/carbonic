import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:sotwo/core/theme/svg/main.dart';
import 'package:sotwo/core/theme/theme.dart';
import 'package:sotwo/core/ui/container/spaced_column.dart';
import 'package:sotwo/core/utility/cast.dart';
import 'package:sotwo/core/utility/time/time.dart';
import 'package:sotwo/feature/event/model/detail.dart';
import 'package:sotwo/feature/event/provider/list.dart';
import 'package:sotwo/feature/route/route.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailPageRoutingInfo extends RoutingInfo {
  const EventDetailPageRoutingInfo({
    required this.id,
  });

  final int id;

  factory EventDetailPageRoutingInfo.fromQueryParameters(
    Map<String, String> queryParameters,
  ) =>
      EventDetailPageRoutingInfo(
        id: cast<int>(queryParameters['id'])!,
      );
}

class EventDetailPage extends ConsumerStatefulWidget {
  const EventDetailPage({
    super.key,
    required this.routingInfo,
  });

  final EventDetailPageRoutingInfo routingInfo;

  @override
  ConsumerState<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends ConsumerState<EventDetailPage> {
  late final EventDetailModel? _model;

  @override
  void initState() {
    super.initState();
    _model =
        ref.read(eventListProvider.notifier).getDetail(widget.routingInfo.id);
  }

  @override
  Widget build(BuildContext context) {
    if (_model == null) {
      // TODO : 로드 실패 UI
      return Container(
        color: Colors.red,
        child: const Text('로드 실패'),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('이벤트'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Title(
                title: _model!.title,
                date: _model!.time,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: SabColorTheme.black6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 28,
                ),
                child: SpacedColumn(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  separator: const Gap(24),
                  children: [
                    _model!.imageUrl == null
                        ? const SizedBox()
                        : CachedNetworkImage(
                            imageUrl: _model!.imageUrl!,
                            fit: BoxFit.fitHeight,
                          ),
                    if (_model!.message != null) Text(_model!.message!),
                    if (_model!.externalLinkUrl != null)
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () async {
                          final uri = Uri.parse(_model!.externalLinkUrl!);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        },
                        child: SizedBox(
                          height: 30,
                          width: double.infinity,
                          child: Row(
                            children: [
                              const SabSvg(
                                SvgData.test,
                                width: 20,
                              ),
                              const Gap(10),
                              Text(_model!.externalLinkTitle ?? ''),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
    required this.title,
    required this.date,
  });

  final String title;
  final SabDateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 28,
        left: 15,
        right: 15,
      ),
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
    );
  }
}

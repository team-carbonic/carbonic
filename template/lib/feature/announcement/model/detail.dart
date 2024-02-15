import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sotwo/core/utility/cast.dart';
import 'package:sotwo/core/utility/time/time.dart';

part 'detail.freezed.dart';
part 'detail.g.dart';

// TODO: API 규격 재정의 시 수정 필요
@freezed
class AnnouncementDetailModel with _$AnnouncementDetailModel {
  factory AnnouncementDetailModel({
    @JsonKey(name: 'seq') required final int id,
    @JsonKey(name: 'startAt', readValue: AnnouncementDetailModel._readStartDate)
    required final SabDateTime time,
    @JsonKey(name: 'title') required final String title,
    @JsonKey(name: 'imageUrl') final String? imageUrl,
    @JsonKey(name: 'message') final String? message,
    @JsonKey(name: 'externalLinkTitle') final String? externalLinkTitle,
    @JsonKey(name: 'externalLinkUrl') final String? externalLinkUrl,
  }) = _AnnouncementDetailModel;

  factory AnnouncementDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementDetailModelFromJson(json);

  // TODO: 서버와 주고받을 시간 데이터의 규격이 정해지면 수정 필요
  static SabDateTime _readStartDate(final Map json, final String key) {
    final startTimeString = cast<String>(json[key])!;
    final startTime = DateTime.parse(startTimeString);
    return SabDateTime(data: startTime);
  }
}

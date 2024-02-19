import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sotwo/core/model/pagenation.dart';
import 'package:sotwo/feature/announcement/model/detail.dart';

part 'list.freezed.dart';
part 'list.g.dart';

@freezed
class AnnouncementListModel with _$AnnouncementListModel {
  factory AnnouncementListModel({
    @JsonKey(name: 'notificationList')
    required final List<AnnouncementDetailModel> announcementDetails,
    @JsonKey(name: 'page') required final PagenationModel pagenation,
  }) = _AnnouncementListModel;

  factory AnnouncementListModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementListModelFromJson(json);
}

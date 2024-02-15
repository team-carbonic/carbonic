import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sotwo/core/model/pagenation.dart';
import 'package:sotwo/feature/event/model/detail.dart';

part 'list.freezed.dart';
part 'list.g.dart';

@freezed
class EventListModel with _$EventListModel {
  factory EventListModel({
    @JsonKey(name: 'notificationList')
    required final List<EventDetailModel> eventDetails,
    @JsonKey(name: 'page') required final PagenationModel pagenation,
  }) = _EventListModel;

  factory EventListModel.fromJson(Map<String, dynamic> json) =>
      _$EventListModelFromJson(json);
}

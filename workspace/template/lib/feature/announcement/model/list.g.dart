// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnouncementListModelImpl _$$AnnouncementListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementListModelImpl(
      announcementDetails: (json['notificationList'] as List<dynamic>)
          .map((e) =>
              AnnouncementDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagenation:
          PagenationModel.fromJson(json['page'] as Map<String, dynamic>),
    );

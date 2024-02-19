// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventListModelImpl _$$EventListModelImplFromJson(Map<String, dynamic> json) =>
    _$EventListModelImpl(
      eventDetails: (json['notificationList'] as List<dynamic>)
          .map((e) => EventDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagenation:
          PagenationModel.fromJson(json['page'] as Map<String, dynamic>),
    );

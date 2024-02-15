// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnouncementDetailModelImpl _$$AnnouncementDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementDetailModelImpl(
      id: json['seq'] as int,
      time: SabDateTime.fromJson(
          AnnouncementDetailModel._readStartDate(json, 'startAt') as String),
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      message: json['message'] as String?,
      externalLinkTitle: json['externalLinkTitle'] as String?,
      externalLinkUrl: json['externalLinkUrl'] as String?,
    );

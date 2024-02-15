// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDetailModelImpl _$$EventDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventDetailModelImpl(
      id: json['seq'] as int,
      time: SabDateTime.fromJson(
          EventDetailModel._readStartDate(json, 'startAt') as String),
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      message: json['message'] as String?,
      externalLinkTitle: json['externalLinkTitle'] as String?,
      externalLinkUrl: json['externalLinkUrl'] as String?,
    );

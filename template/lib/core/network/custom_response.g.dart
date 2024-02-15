// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomResponseImpl<T> _$$CustomResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$CustomResponseImpl<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

_$CustomResponseErrorImpl _$$CustomResponseErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomResponseErrorImpl(
      code: $enumDecode(_$CustomResponseErrorCodeEnumMap, json['code'],
          unknownValue: CustomResponseErrorCode.unknown),
      message: json['message'] as String?,
      detail: json['detail'] as Map<String, dynamic>?,
    );

const _$CustomResponseErrorCodeEnumMap = {
  CustomResponseErrorCode.unknown: 'unknown',
};

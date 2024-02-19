// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventDetailModel _$EventDetailModelFromJson(Map<String, dynamic> json) {
  return _EventDetailModel.fromJson(json);
}

/// @nodoc
mixin _$EventDetailModel {
  @JsonKey(name: 'seq')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'startAt', readValue: EventDetailModel._readStartDate)
  SabDateTime get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'externalLinkTitle')
  String? get externalLinkTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'externalLinkUrl')
  String? get externalLinkUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventDetailModelCopyWith<EventDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDetailModelCopyWith<$Res> {
  factory $EventDetailModelCopyWith(
          EventDetailModel value, $Res Function(EventDetailModel) then) =
      _$EventDetailModelCopyWithImpl<$Res, EventDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'seq') int id,
      @JsonKey(name: 'startAt', readValue: EventDetailModel._readStartDate)
      SabDateTime time,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'externalLinkTitle') String? externalLinkTitle,
      @JsonKey(name: 'externalLinkUrl') String? externalLinkUrl});

  $SabDateTimeCopyWith<$Res> get time;
}

/// @nodoc
class _$EventDetailModelCopyWithImpl<$Res, $Val extends EventDetailModel>
    implements $EventDetailModelCopyWith<$Res> {
  _$EventDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? title = null,
    Object? imageUrl = freezed,
    Object? message = freezed,
    Object? externalLinkTitle = freezed,
    Object? externalLinkUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as SabDateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      externalLinkTitle: freezed == externalLinkTitle
          ? _value.externalLinkTitle
          : externalLinkTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      externalLinkUrl: freezed == externalLinkUrl
          ? _value.externalLinkUrl
          : externalLinkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SabDateTimeCopyWith<$Res> get time {
    return $SabDateTimeCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventDetailModelImplCopyWith<$Res>
    implements $EventDetailModelCopyWith<$Res> {
  factory _$$EventDetailModelImplCopyWith(_$EventDetailModelImpl value,
          $Res Function(_$EventDetailModelImpl) then) =
      __$$EventDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'seq') int id,
      @JsonKey(name: 'startAt', readValue: EventDetailModel._readStartDate)
      SabDateTime time,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'externalLinkTitle') String? externalLinkTitle,
      @JsonKey(name: 'externalLinkUrl') String? externalLinkUrl});

  @override
  $SabDateTimeCopyWith<$Res> get time;
}

/// @nodoc
class __$$EventDetailModelImplCopyWithImpl<$Res>
    extends _$EventDetailModelCopyWithImpl<$Res, _$EventDetailModelImpl>
    implements _$$EventDetailModelImplCopyWith<$Res> {
  __$$EventDetailModelImplCopyWithImpl(_$EventDetailModelImpl _value,
      $Res Function(_$EventDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? title = null,
    Object? imageUrl = freezed,
    Object? message = freezed,
    Object? externalLinkTitle = freezed,
    Object? externalLinkUrl = freezed,
  }) {
    return _then(_$EventDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as SabDateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      externalLinkTitle: freezed == externalLinkTitle
          ? _value.externalLinkTitle
          : externalLinkTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      externalLinkUrl: freezed == externalLinkUrl
          ? _value.externalLinkUrl
          : externalLinkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventDetailModelImpl implements _EventDetailModel {
  _$EventDetailModelImpl(
      {@JsonKey(name: 'seq') required this.id,
      @JsonKey(name: 'startAt', readValue: EventDetailModel._readStartDate)
      required this.time,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'imageUrl') this.imageUrl,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'externalLinkTitle') this.externalLinkTitle,
      @JsonKey(name: 'externalLinkUrl') this.externalLinkUrl});

  factory _$EventDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'seq')
  final int id;
  @override
  @JsonKey(name: 'startAt', readValue: EventDetailModel._readStartDate)
  final SabDateTime time;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'externalLinkTitle')
  final String? externalLinkTitle;
  @override
  @JsonKey(name: 'externalLinkUrl')
  final String? externalLinkUrl;

  @override
  String toString() {
    return 'EventDetailModel(id: $id, time: $time, title: $title, imageUrl: $imageUrl, message: $message, externalLinkTitle: $externalLinkTitle, externalLinkUrl: $externalLinkUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.externalLinkTitle, externalLinkTitle) ||
                other.externalLinkTitle == externalLinkTitle) &&
            (identical(other.externalLinkUrl, externalLinkUrl) ||
                other.externalLinkUrl == externalLinkUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, time, title, imageUrl,
      message, externalLinkTitle, externalLinkUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDetailModelImplCopyWith<_$EventDetailModelImpl> get copyWith =>
      __$$EventDetailModelImplCopyWithImpl<_$EventDetailModelImpl>(
          this, _$identity);
}

abstract class _EventDetailModel implements EventDetailModel {
  factory _EventDetailModel(
          {@JsonKey(name: 'seq') required final int id,
          @JsonKey(name: 'startAt', readValue: EventDetailModel._readStartDate)
          required final SabDateTime time,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'imageUrl') final String? imageUrl,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'externalLinkTitle') final String? externalLinkTitle,
          @JsonKey(name: 'externalLinkUrl') final String? externalLinkUrl}) =
      _$EventDetailModelImpl;

  factory _EventDetailModel.fromJson(Map<String, dynamic> json) =
      _$EventDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'seq')
  int get id;
  @override
  @JsonKey(name: 'startAt', readValue: EventDetailModel._readStartDate)
  SabDateTime get time;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'externalLinkTitle')
  String? get externalLinkTitle;
  @override
  @JsonKey(name: 'externalLinkUrl')
  String? get externalLinkUrl;
  @override
  @JsonKey(ignore: true)
  _$$EventDetailModelImplCopyWith<_$EventDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomResponse<T> _$CustomResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _CustomResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$CustomResponse<T> {
  T? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomResponseCopyWith<T, CustomResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomResponseCopyWith<T, $Res> {
  factory $CustomResponseCopyWith(
          CustomResponse<T> value, $Res Function(CustomResponse<T>) then) =
      _$CustomResponseCopyWithImpl<T, $Res, CustomResponse<T>>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class _$CustomResponseCopyWithImpl<T, $Res, $Val extends CustomResponse<T>>
    implements $CustomResponseCopyWith<T, $Res> {
  _$CustomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomResponseImplCopyWith<T, $Res>
    implements $CustomResponseCopyWith<T, $Res> {
  factory _$$CustomResponseImplCopyWith(_$CustomResponseImpl<T> value,
          $Res Function(_$CustomResponseImpl<T>) then) =
      __$$CustomResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$CustomResponseImplCopyWithImpl<T, $Res>
    extends _$CustomResponseCopyWithImpl<T, $Res, _$CustomResponseImpl<T>>
    implements _$$CustomResponseImplCopyWith<T, $Res> {
  __$$CustomResponseImplCopyWithImpl(_$CustomResponseImpl<T> _value,
      $Res Function(_$CustomResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CustomResponseImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class _$CustomResponseImpl<T> extends _CustomResponse<T> {
  _$CustomResponseImpl({this.data}) : super._();

  factory _$CustomResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$CustomResponseImplFromJson(json, fromJsonT);

  @override
  final T? data;

  @override
  String toString() {
    return 'CustomResponse<$T>(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomResponseImplCopyWith<T, _$CustomResponseImpl<T>> get copyWith =>
      __$$CustomResponseImplCopyWithImpl<T, _$CustomResponseImpl<T>>(
          this, _$identity);
}

abstract class _CustomResponse<T> extends CustomResponse<T> {
  factory _CustomResponse({final T? data}) = _$CustomResponseImpl<T>;
  _CustomResponse._() : super._();

  factory _CustomResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$CustomResponseImpl<T>.fromJson;

  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$CustomResponseImplCopyWith<T, _$CustomResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomResponseError _$CustomResponseErrorFromJson(Map<String, dynamic> json) {
  return _CustomResponseError.fromJson(json);
}

/// @nodoc
mixin _$CustomResponseError {
  @JsonKey(unknownEnumValue: CustomResponseErrorCode.unknown)
  CustomResponseErrorCode get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get detail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomResponseErrorCopyWith<CustomResponseError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomResponseErrorCopyWith<$Res> {
  factory $CustomResponseErrorCopyWith(
          CustomResponseError value, $Res Function(CustomResponseError) then) =
      _$CustomResponseErrorCopyWithImpl<$Res, CustomResponseError>;
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: CustomResponseErrorCode.unknown)
      CustomResponseErrorCode code,
      String? message,
      Map<String, dynamic>? detail});
}

/// @nodoc
class _$CustomResponseErrorCopyWithImpl<$Res, $Val extends CustomResponseError>
    implements $CustomResponseErrorCopyWith<$Res> {
  _$CustomResponseErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
    Object? detail = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CustomResponseErrorCode,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomResponseErrorImplCopyWith<$Res>
    implements $CustomResponseErrorCopyWith<$Res> {
  factory _$$CustomResponseErrorImplCopyWith(_$CustomResponseErrorImpl value,
          $Res Function(_$CustomResponseErrorImpl) then) =
      __$$CustomResponseErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(unknownEnumValue: CustomResponseErrorCode.unknown)
      CustomResponseErrorCode code,
      String? message,
      Map<String, dynamic>? detail});
}

/// @nodoc
class __$$CustomResponseErrorImplCopyWithImpl<$Res>
    extends _$CustomResponseErrorCopyWithImpl<$Res, _$CustomResponseErrorImpl>
    implements _$$CustomResponseErrorImplCopyWith<$Res> {
  __$$CustomResponseErrorImplCopyWithImpl(_$CustomResponseErrorImpl _value,
      $Res Function(_$CustomResponseErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$CustomResponseErrorImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as CustomResponseErrorCode,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CustomResponseErrorImpl implements _CustomResponseError {
  _$CustomResponseErrorImpl(
      {@JsonKey(unknownEnumValue: CustomResponseErrorCode.unknown)
      required this.code,
      this.message,
      final Map<String, dynamic>? detail})
      : _detail = detail;

  factory _$CustomResponseErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomResponseErrorImplFromJson(json);

  @override
  @JsonKey(unknownEnumValue: CustomResponseErrorCode.unknown)
  final CustomResponseErrorCode code;
  @override
  final String? message;
  final Map<String, dynamic>? _detail;
  @override
  Map<String, dynamic>? get detail {
    final value = _detail;
    if (value == null) return null;
    if (_detail is EqualUnmodifiableMapView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CustomResponseError(code: $code, message: $message, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomResponseErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, message, const DeepCollectionEquality().hash(_detail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomResponseErrorImplCopyWith<_$CustomResponseErrorImpl> get copyWith =>
      __$$CustomResponseErrorImplCopyWithImpl<_$CustomResponseErrorImpl>(
          this, _$identity);
}

abstract class _CustomResponseError implements CustomResponseError {
  factory _CustomResponseError(
      {@JsonKey(unknownEnumValue: CustomResponseErrorCode.unknown)
      required final CustomResponseErrorCode code,
      final String? message,
      final Map<String, dynamic>? detail}) = _$CustomResponseErrorImpl;

  factory _CustomResponseError.fromJson(Map<String, dynamic> json) =
      _$CustomResponseErrorImpl.fromJson;

  @override
  @JsonKey(unknownEnumValue: CustomResponseErrorCode.unknown)
  CustomResponseErrorCode get code;
  @override
  String? get message;
  @override
  Map<String, dynamic>? get detail;
  @override
  @JsonKey(ignore: true)
  _$$CustomResponseErrorImplCopyWith<_$CustomResponseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

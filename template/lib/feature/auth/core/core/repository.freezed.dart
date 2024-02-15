// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceSabIdResponse _$DeviceSabIdResponseFromJson(Map<String, dynamic> json) {
  return _DeviceSabIdResponse.fromJson(json);
}

/// @nodoc
mixin _$DeviceSabIdResponse {
  @JsonKey(name: 'ci')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'newDevice')
  bool get isNewDevice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceSabIdResponseCopyWith<DeviceSabIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceSabIdResponseCopyWith<$Res> {
  factory $DeviceSabIdResponseCopyWith(
          DeviceSabIdResponse value, $Res Function(DeviceSabIdResponse) then) =
      _$DeviceSabIdResponseCopyWithImpl<$Res, DeviceSabIdResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ci') String id,
      @JsonKey(name: 'newDevice') bool isNewDevice});
}

/// @nodoc
class _$DeviceSabIdResponseCopyWithImpl<$Res, $Val extends DeviceSabIdResponse>
    implements $DeviceSabIdResponseCopyWith<$Res> {
  _$DeviceSabIdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isNewDevice = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isNewDevice: null == isNewDevice
          ? _value.isNewDevice
          : isNewDevice // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceSabIdResponseImplCopyWith<$Res>
    implements $DeviceSabIdResponseCopyWith<$Res> {
  factory _$$DeviceSabIdResponseImplCopyWith(_$DeviceSabIdResponseImpl value,
          $Res Function(_$DeviceSabIdResponseImpl) then) =
      __$$DeviceSabIdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ci') String id,
      @JsonKey(name: 'newDevice') bool isNewDevice});
}

/// @nodoc
class __$$DeviceSabIdResponseImplCopyWithImpl<$Res>
    extends _$DeviceSabIdResponseCopyWithImpl<$Res, _$DeviceSabIdResponseImpl>
    implements _$$DeviceSabIdResponseImplCopyWith<$Res> {
  __$$DeviceSabIdResponseImplCopyWithImpl(_$DeviceSabIdResponseImpl _value,
      $Res Function(_$DeviceSabIdResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isNewDevice = null,
  }) {
    return _then(_$DeviceSabIdResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isNewDevice: null == isNewDevice
          ? _value.isNewDevice
          : isNewDevice // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$DeviceSabIdResponseImpl implements _DeviceSabIdResponse {
  _$DeviceSabIdResponseImpl(
      {@JsonKey(name: 'ci') required this.id,
      @JsonKey(name: 'newDevice') required this.isNewDevice});

  factory _$DeviceSabIdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceSabIdResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ci')
  final String id;
  @override
  @JsonKey(name: 'newDevice')
  final bool isNewDevice;

  @override
  String toString() {
    return 'DeviceSabIdResponse(id: $id, isNewDevice: $isNewDevice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceSabIdResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isNewDevice, isNewDevice) ||
                other.isNewDevice == isNewDevice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, isNewDevice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceSabIdResponseImplCopyWith<_$DeviceSabIdResponseImpl> get copyWith =>
      __$$DeviceSabIdResponseImplCopyWithImpl<_$DeviceSabIdResponseImpl>(
          this, _$identity);
}

abstract class _DeviceSabIdResponse implements DeviceSabIdResponse {
  factory _DeviceSabIdResponse(
          {@JsonKey(name: 'ci') required final String id,
          @JsonKey(name: 'newDevice') required final bool isNewDevice}) =
      _$DeviceSabIdResponseImpl;

  factory _DeviceSabIdResponse.fromJson(Map<String, dynamic> json) =
      _$DeviceSabIdResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ci')
  String get id;
  @override
  @JsonKey(name: 'newDevice')
  bool get isNewDevice;
  @override
  @JsonKey(ignore: true)
  _$$DeviceSabIdResponseImplCopyWith<_$DeviceSabIdResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

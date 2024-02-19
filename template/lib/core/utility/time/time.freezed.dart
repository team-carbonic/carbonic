// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SabDateTime {
  DateTime get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SabDateTimeCopyWith<SabDateTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SabDateTimeCopyWith<$Res> {
  factory $SabDateTimeCopyWith(
          SabDateTime value, $Res Function(SabDateTime) then) =
      _$SabDateTimeCopyWithImpl<$Res, SabDateTime>;
  @useResult
  $Res call({DateTime data});
}

/// @nodoc
class _$SabDateTimeCopyWithImpl<$Res, $Val extends SabDateTime>
    implements $SabDateTimeCopyWith<$Res> {
  _$SabDateTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SabDateTimeImplCopyWith<$Res>
    implements $SabDateTimeCopyWith<$Res> {
  factory _$$SabDateTimeImplCopyWith(
          _$SabDateTimeImpl value, $Res Function(_$SabDateTimeImpl) then) =
      __$$SabDateTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime data});
}

/// @nodoc
class __$$SabDateTimeImplCopyWithImpl<$Res>
    extends _$SabDateTimeCopyWithImpl<$Res, _$SabDateTimeImpl>
    implements _$$SabDateTimeImplCopyWith<$Res> {
  __$$SabDateTimeImplCopyWithImpl(
      _$SabDateTimeImpl _value, $Res Function(_$SabDateTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SabDateTimeImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SabDateTimeImpl extends _SabDateTime {
  _$SabDateTimeImpl({required this.data}) : super._();

  @override
  final DateTime data;

  @override
  String toString() {
    return 'SabDateTime(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SabDateTimeImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SabDateTimeImplCopyWith<_$SabDateTimeImpl> get copyWith =>
      __$$SabDateTimeImplCopyWithImpl<_$SabDateTimeImpl>(this, _$identity);
}

abstract class _SabDateTime extends SabDateTime {
  factory _SabDateTime({required final DateTime data}) = _$SabDateTimeImpl;
  _SabDateTime._() : super._();

  @override
  DateTime get data;
  @override
  @JsonKey(ignore: true)
  _$$SabDateTimeImplCopyWith<_$SabDateTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

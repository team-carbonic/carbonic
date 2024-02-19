// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'router.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RouterRefreshListenable _$RouterRefreshListenableFromJson(
    Map<String, dynamic> json) {
  return _RouterRefreshListenable.fromJson(json);
}

/// @nodoc
mixin _$RouterRefreshListenable {
  String? get path => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouterRefreshListenableCopyWith<RouterRefreshListenable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouterRefreshListenableCopyWith<$Res> {
  factory $RouterRefreshListenableCopyWith(RouterRefreshListenable value,
          $Res Function(RouterRefreshListenable) then) =
      _$RouterRefreshListenableCopyWithImpl<$Res, RouterRefreshListenable>;
  @useResult
  $Res call({String? path});
}

/// @nodoc
class _$RouterRefreshListenableCopyWithImpl<$Res,
        $Val extends RouterRefreshListenable>
    implements $RouterRefreshListenableCopyWith<$Res> {
  _$RouterRefreshListenableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouterRefreshListenableImplCopyWith<$Res>
    implements $RouterRefreshListenableCopyWith<$Res> {
  factory _$$RouterRefreshListenableImplCopyWith(
          _$RouterRefreshListenableImpl value,
          $Res Function(_$RouterRefreshListenableImpl) then) =
      __$$RouterRefreshListenableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? path});
}

/// @nodoc
class __$$RouterRefreshListenableImplCopyWithImpl<$Res>
    extends _$RouterRefreshListenableCopyWithImpl<$Res,
        _$RouterRefreshListenableImpl>
    implements _$$RouterRefreshListenableImplCopyWith<$Res> {
  __$$RouterRefreshListenableImplCopyWithImpl(
      _$RouterRefreshListenableImpl _value,
      $Res Function(_$RouterRefreshListenableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = freezed,
  }) {
    return _then(_$RouterRefreshListenableImpl(
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$RouterRefreshListenableImpl implements _RouterRefreshListenable {
  _$RouterRefreshListenableImpl({required this.path});

  factory _$RouterRefreshListenableImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouterRefreshListenableImplFromJson(json);

  @override
  final String? path;

  @override
  String toString() {
    return 'RouterRefreshListenable(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouterRefreshListenableImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouterRefreshListenableImplCopyWith<_$RouterRefreshListenableImpl>
      get copyWith => __$$RouterRefreshListenableImplCopyWithImpl<
          _$RouterRefreshListenableImpl>(this, _$identity);
}

abstract class _RouterRefreshListenable implements RouterRefreshListenable {
  factory _RouterRefreshListenable({required final String? path}) =
      _$RouterRefreshListenableImpl;

  factory _RouterRefreshListenable.fromJson(Map<String, dynamic> json) =
      _$RouterRefreshListenableImpl.fromJson;

  @override
  String? get path;
  @override
  @JsonKey(ignore: true)
  _$$RouterRefreshListenableImplCopyWith<_$RouterRefreshListenableImpl>
      get copyWith => throw _privateConstructorUsedError;
}

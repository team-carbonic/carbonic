// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthFormPageResultModel _$AuthFormPageResultModelFromJson(
    Map<String, dynamic> json) {
  return _AuthFormPageResultModel.fromJson(json);
}

/// @nodoc
mixin _$AuthFormPageResultModel {
  AuthFormPageResult get result => throw _privateConstructorUsedError;
  int? get secondsToBeResendable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthFormPageResultModelCopyWith<AuthFormPageResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFormPageResultModelCopyWith<$Res> {
  factory $AuthFormPageResultModelCopyWith(AuthFormPageResultModel value,
          $Res Function(AuthFormPageResultModel) then) =
      _$AuthFormPageResultModelCopyWithImpl<$Res, AuthFormPageResultModel>;
  @useResult
  $Res call({AuthFormPageResult result, int? secondsToBeResendable});
}

/// @nodoc
class _$AuthFormPageResultModelCopyWithImpl<$Res,
        $Val extends AuthFormPageResultModel>
    implements $AuthFormPageResultModelCopyWith<$Res> {
  _$AuthFormPageResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? secondsToBeResendable = freezed,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AuthFormPageResult,
      secondsToBeResendable: freezed == secondsToBeResendable
          ? _value.secondsToBeResendable
          : secondsToBeResendable // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthFormPageResultModelImplCopyWith<$Res>
    implements $AuthFormPageResultModelCopyWith<$Res> {
  factory _$$AuthFormPageResultModelImplCopyWith(
          _$AuthFormPageResultModelImpl value,
          $Res Function(_$AuthFormPageResultModelImpl) then) =
      __$$AuthFormPageResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthFormPageResult result, int? secondsToBeResendable});
}

/// @nodoc
class __$$AuthFormPageResultModelImplCopyWithImpl<$Res>
    extends _$AuthFormPageResultModelCopyWithImpl<$Res,
        _$AuthFormPageResultModelImpl>
    implements _$$AuthFormPageResultModelImplCopyWith<$Res> {
  __$$AuthFormPageResultModelImplCopyWithImpl(
      _$AuthFormPageResultModelImpl _value,
      $Res Function(_$AuthFormPageResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? secondsToBeResendable = freezed,
  }) {
    return _then(_$AuthFormPageResultModelImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AuthFormPageResult,
      secondsToBeResendable: freezed == secondsToBeResendable
          ? _value.secondsToBeResendable
          : secondsToBeResendable // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$AuthFormPageResultModelImpl implements _AuthFormPageResultModel {
  _$AuthFormPageResultModelImpl(
      {required this.result, this.secondsToBeResendable});

  factory _$AuthFormPageResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthFormPageResultModelImplFromJson(json);

  @override
  final AuthFormPageResult result;
  @override
  final int? secondsToBeResendable;

  @override
  String toString() {
    return 'AuthFormPageResultModel(result: $result, secondsToBeResendable: $secondsToBeResendable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFormPageResultModelImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.secondsToBeResendable, secondsToBeResendable) ||
                other.secondsToBeResendable == secondsToBeResendable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result, secondsToBeResendable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFormPageResultModelImplCopyWith<_$AuthFormPageResultModelImpl>
      get copyWith => __$$AuthFormPageResultModelImplCopyWithImpl<
          _$AuthFormPageResultModelImpl>(this, _$identity);
}

abstract class _AuthFormPageResultModel implements AuthFormPageResultModel {
  factory _AuthFormPageResultModel(
      {required final AuthFormPageResult result,
      final int? secondsToBeResendable}) = _$AuthFormPageResultModelImpl;

  factory _AuthFormPageResultModel.fromJson(Map<String, dynamic> json) =
      _$AuthFormPageResultModelImpl.fromJson;

  @override
  AuthFormPageResult get result;
  @override
  int? get secondsToBeResendable;
  @override
  @JsonKey(ignore: true)
  _$$AuthFormPageResultModelImplCopyWith<_$AuthFormPageResultModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

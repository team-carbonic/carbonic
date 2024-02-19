// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettingModel _$UserSettingModelFromJson(Map<String, dynamic> json) {
  return _UserSettingModel.fromJson(json);
}

/// @nodoc
mixin _$UserSettingModel {
  bool? get useBiometricLogin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingModelCopyWith<UserSettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingModelCopyWith<$Res> {
  factory $UserSettingModelCopyWith(
          UserSettingModel value, $Res Function(UserSettingModel) then) =
      _$UserSettingModelCopyWithImpl<$Res, UserSettingModel>;
  @useResult
  $Res call({bool? useBiometricLogin});
}

/// @nodoc
class _$UserSettingModelCopyWithImpl<$Res, $Val extends UserSettingModel>
    implements $UserSettingModelCopyWith<$Res> {
  _$UserSettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useBiometricLogin = freezed,
  }) {
    return _then(_value.copyWith(
      useBiometricLogin: freezed == useBiometricLogin
          ? _value.useBiometricLogin
          : useBiometricLogin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSettingModelImplCopyWith<$Res>
    implements $UserSettingModelCopyWith<$Res> {
  factory _$$UserSettingModelImplCopyWith(_$UserSettingModelImpl value,
          $Res Function(_$UserSettingModelImpl) then) =
      __$$UserSettingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? useBiometricLogin});
}

/// @nodoc
class __$$UserSettingModelImplCopyWithImpl<$Res>
    extends _$UserSettingModelCopyWithImpl<$Res, _$UserSettingModelImpl>
    implements _$$UserSettingModelImplCopyWith<$Res> {
  __$$UserSettingModelImplCopyWithImpl(_$UserSettingModelImpl _value,
      $Res Function(_$UserSettingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useBiometricLogin = freezed,
  }) {
    return _then(_$UserSettingModelImpl(
      useBiometricLogin: freezed == useBiometricLogin
          ? _value.useBiometricLogin
          : useBiometricLogin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingModelImpl implements _UserSettingModel {
  _$UserSettingModelImpl({required this.useBiometricLogin});

  factory _$UserSettingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingModelImplFromJson(json);

  @override
  final bool? useBiometricLogin;

  @override
  String toString() {
    return 'UserSettingModel(useBiometricLogin: $useBiometricLogin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingModelImpl &&
            (identical(other.useBiometricLogin, useBiometricLogin) ||
                other.useBiometricLogin == useBiometricLogin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, useBiometricLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingModelImplCopyWith<_$UserSettingModelImpl> get copyWith =>
      __$$UserSettingModelImplCopyWithImpl<_$UserSettingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingModelImplToJson(
      this,
    );
  }
}

abstract class _UserSettingModel implements UserSettingModel {
  factory _UserSettingModel({required final bool? useBiometricLogin}) =
      _$UserSettingModelImpl;

  factory _UserSettingModel.fromJson(Map<String, dynamic> json) =
      _$UserSettingModelImpl.fromJson;

  @override
  bool? get useBiometricLogin;
  @override
  @JsonKey(ignore: true)
  _$$UserSettingModelImplCopyWith<_$UserSettingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

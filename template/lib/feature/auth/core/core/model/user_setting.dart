import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_setting.freezed.dart';
part 'user_setting.g.dart';

@Freezed(toJson: true)
class UserSettingModel with _$UserSettingModel {
  const UserSettingModel._();

  factory UserSettingModel({
    required bool? useBiometricLogin,
  }) = _UserSettingModel;

  factory UserSettingModel.fromJson(Map<String, dynamic> json) =>
      _$UserSettingModelFromJson(json);
}

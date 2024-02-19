import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sotwo/core/utility/local_storage/manager.dart';
import 'package:sotwo/feature/auth/core/core/model/user_setting.dart';

part 'user_setting.g.dart';

@riverpod
class UserSetting extends _$UserSetting {
  @override
  UserSettingModel? build(final int userId) {
    final data = LocalStorageManager.getData(
      category: LocalStorageCategory.userSetting,
      userId: userId,
    );
    if (data != null) {
      return UserSettingModel.fromJson(data);
    }
    return null;
  }

  void update(final UserSettingModel model) {
    state = model;
    LocalStorageManager.setData(
      category: LocalStorageCategory.userSetting,
      userId: userId,
      data: model.toJson(),
    );
  }
}

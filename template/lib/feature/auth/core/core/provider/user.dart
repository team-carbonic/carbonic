import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sotwo/feature/auth/core/core/model/user.dart';

part 'user.g.dart';

@riverpod
class User extends _$User {
  @override
  UserModel? build() {
    // TODO : 임시로 유저를 생성해둔 상태
    return UserModel(id: 1233251798);
  }
}

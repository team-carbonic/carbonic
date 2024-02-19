import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider.freezed.dart';
part 'provider.g.dart';

enum AuthFormPageResult {
  none,
  validCertificateNumber,
  invalidCertificateNumber,
  invalidPersonalInformation,
  unableToSendCertificateNumber,
  unknownError,
  ;
}

@freezed
class AuthFormPageResultModel with _$AuthFormPageResultModel {
  factory AuthFormPageResultModel({
    required final AuthFormPageResult result,
    final int? secondsToBeResendable,
  }) = _AuthFormPageResultModel;

  factory AuthFormPageResultModel.fromJson(Map<String, dynamic> json) =>
      _$AuthFormPageResultModelFromJson(json);
}

@riverpod
class AuthFormPageStatus extends _$AuthFormPageStatus {
  @override
  AuthFormPageResultModel build() {
    return AuthFormPageResultModel(result: AuthFormPageResult.none);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthFormPageResultModelImpl _$$AuthFormPageResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthFormPageResultModelImpl(
      result: $enumDecode(_$AuthFormPageResultEnumMap, json['result']),
      secondsToBeResendable: json['secondsToBeResendable'] as int?,
    );

const _$AuthFormPageResultEnumMap = {
  AuthFormPageResult.none: 'none',
  AuthFormPageResult.validCertificateNumber: 'validCertificateNumber',
  AuthFormPageResult.invalidCertificateNumber: 'invalidCertificateNumber',
  AuthFormPageResult.invalidPersonalInformation: 'invalidPersonalInformation',
  AuthFormPageResult.unableToSendCertificateNumber:
      'unableToSendCertificateNumber',
  AuthFormPageResult.unknownError: 'unknownError',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authFormPageStatusHash() =>
    r'318552c81df4fe144b233e1ff36d1e25faabc31f';

/// See also [AuthFormPageStatus].
@ProviderFor(AuthFormPageStatus)
final authFormPageStatusProvider = AutoDisposeNotifierProvider<
    AuthFormPageStatus, AuthFormPageResultModel>.internal(
  AuthFormPageStatus.new,
  name: r'authFormPageStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authFormPageStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthFormPageStatus = AutoDisposeNotifier<AuthFormPageResultModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

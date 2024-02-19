// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_setting.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userSettingHash() => r'd617c0e0cc9a06410e2808ed08ae04a586c72fe8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$UserSetting
    extends BuildlessAutoDisposeNotifier<UserSettingModel?> {
  late final int userId;

  UserSettingModel? build(
    int userId,
  );
}

/// See also [UserSetting].
@ProviderFor(UserSetting)
const userSettingProvider = UserSettingFamily();

/// See also [UserSetting].
class UserSettingFamily extends Family<UserSettingModel?> {
  /// See also [UserSetting].
  const UserSettingFamily();

  /// See also [UserSetting].
  UserSettingProvider call(
    int userId,
  ) {
    return UserSettingProvider(
      userId,
    );
  }

  @override
  UserSettingProvider getProviderOverride(
    covariant UserSettingProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userSettingProvider';
}

/// See also [UserSetting].
class UserSettingProvider
    extends AutoDisposeNotifierProviderImpl<UserSetting, UserSettingModel?> {
  /// See also [UserSetting].
  UserSettingProvider(
    int userId,
  ) : this._internal(
          () => UserSetting()..userId = userId,
          from: userSettingProvider,
          name: r'userSettingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userSettingHash,
          dependencies: UserSettingFamily._dependencies,
          allTransitiveDependencies:
              UserSettingFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserSettingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  UserSettingModel? runNotifierBuild(
    covariant UserSetting notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserSetting Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserSettingProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<UserSetting, UserSettingModel?>
      createElement() {
    return _UserSettingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserSettingProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserSettingRef on AutoDisposeNotifierProviderRef<UserSettingModel?> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _UserSettingProviderElement
    extends AutoDisposeNotifierProviderElement<UserSetting, UserSettingModel?>
    with UserSettingRef {
  _UserSettingProviderElement(super.provider);

  @override
  int get userId => (origin as UserSettingProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

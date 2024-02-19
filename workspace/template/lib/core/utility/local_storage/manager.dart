import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sotwo/core/utility/cast.dart';
import 'package:sotwo/core/utility/local_storage/has_done_checker.dart';
import 'package:sotwo/core/utility/logger/core/core.dart';
import 'package:sotwo/core/utility/logger/logger.dart';

enum LocalStorageCategory {
  /// [HasDoneChecker] 전용
  hasDoneChecker,

  userSetting,
  ;

  GetStorage get storage => GetStorage(storageKey);

  /// ex) hasDoneChecker -> has_done_checker
  String get storageKey => name.replaceAllMapped(
        RegExp('[A-Z]'),
        (match) => '_${match.group(0)!.toLowerCase()}',
      );
}

enum LocalSecurityStorageKey {
  deviceSabId,
  ;

  /// ex) deviceSabId -> device_sab_id
  String get key => name.replaceAllMapped(
        RegExp('[A-Z]'),
        (match) => '_${match.group(0)!.toLowerCase()}',
      );
}

class LocalStorageManager {
  const LocalStorageManager._();

  static final securityStorage = _SecurityStorageComponent();

  static Future<void> initialize() async {
    await Future.wait([
      for (final category in LocalStorageCategory.values)
        GetStorage.init(category.storageKey),
    ]);
    Logger.info(
      content: '로컬 저장소 초기화 완료',
      title: 'LocalStorageManager.initialize()',
      category: LogCategory.localStorage,
    );
  }

  static Map<String, Object?>? getData({
    required final LocalStorageCategory category,
    final int? userId,
    final String? extraIdentifier,
  }) {
    try {
      final encodedData = category.storage.read(
        _makeKey(
          category: category,
          userId: userId,
          extraIdentifier: extraIdentifier,
        ),
      );
      if (encodedData == null) {
        return null;
      }
      final data = cast<Map<String, Object?>>(jsonDecode(encodedData))!;
      Logger.info(
        content:
            '로컬 저장소 데이터 로드 완료\ncategory: ${category.name} userId: $userId, '
            'extraIdentifier: $extraIdentifier,\ndata: ${_jsonToString(data)}',
        title: 'LocalStorageManager.getData()',
        category: LogCategory.localStorage,
      );
      return data;
    } catch (e) {
      Logger.error(
        content:
            '로컬 저장소 데이터 로드 실패\ncategory: ${category.name} userId: $userId, '
            'extraIdentifier: $extraIdentifier',
        title: 'LocalStorageManager.getData()',
        category: LogCategory.localStorage,
        exception: e,
      );
      return null;
    }
  }

  static Future<void> setData({
    required final LocalStorageCategory category,
    final int? userId,
    final String? extraIdentifier,
    required final Map<String, Object?> data,
  }) async {
    try {
      final encodedData = jsonEncode(data);
      await category.storage.write(
        _makeKey(
          category: category,
          userId: userId,
          extraIdentifier: extraIdentifier,
        ),
        encodedData,
      );
      Logger.info(
        content:
            '로컬 저장소 데이터 저장 완료\ncategory: ${category.name} userId: $userId, '
            'extraIdentifier: $extraIdentifier,\ndata: ${_jsonToString(data)}',
        title: 'LocalStorageManager.setData()',
        category: LogCategory.localStorage,
      );
    } catch (e, s) {
      Logger.error(
        content:
            '로컬 저장소 데이터 저장 실패\ncategory: ${category.name} userId: $userId, '
            'extraIdentifier: $extraIdentifier,\ndata: ${_jsonToString(data)}',
        title: 'LocalStorageManager.setData()',
        category: LogCategory.localStorage,
        exception: e,
        stackTrace: s,
      );
    }
  }

  static Future<void> clear(final LocalStorageCategory category) async {
    try {
      await category.storage.erase();
      Logger.info(
        content: '로컬 저장소 데이터 초기화 성공\ncategory: ${category.name}',
        title: 'LocalStorageManager.clear()',
        category: LogCategory.localStorage,
      );
    } catch (e, s) {
      Logger.error(
        content: '로컬 저장소 데이터 초기화 실패\ncategory: ${category.name}',
        title: 'LocalStorageManager.clear()',
        category: LogCategory.localStorage,
        exception: e,
        stackTrace: s,
      );
    }
  }

  static List<String> getKeys(final LocalStorageCategory category) {
    return category.storage.getKeys();
  }

  static Future<void> clearByIdentifier({
    required final LocalStorageCategory category,
    final int? userId,
    final String? extraIdentifier,
  }) async {
    try {
      final keys = category.storage.getKeys<Iterable<String>>();
      final keysToClear = keys.fold<Iterable<String>>(
        [],
        (previousList, key) =>
            (userId == null || key.contains(userId.toString())) &&
                    (extraIdentifier == null || key.contains(extraIdentifier))
                ? [...previousList, key]
                : previousList,
      );
      for (final key in keysToClear) {
        await category.storage.write(key, null);
      }
      Logger.info(
        content: '로컬 저장소 단일 데이터 초기화 성공\ncategory: ${category.name}, '
            'userId: $userId, extraIdentifier: $extraIdentifier',
        title: 'LocalStorageManager.clearByIdentifier()',
        category: LogCategory.localStorage,
      );
    } catch (e, s) {
      Logger.error(
        content: '로컬 저장소 단일 데이터 초기화 실패\ncategory: ${category.name} '
            'userId: $userId, extraIdentifier: $extraIdentifier',
        title: 'LocalStorageManager.clearByIdentifier()',
        category: LogCategory.localStorage,
        exception: e,
        stackTrace: s,
      );
    }
  }

  static String _makeKey({
    required final LocalStorageCategory category,
    final int? userId,
    final String? extraIdentifier,
  }) =>
      _concat([
        category.name,
        userId?.toString(),
        extraIdentifier,
      ]);

  static String _concat(final List<String?> elements) =>
      elements.where((element) => element != null).join('_');

  static String _jsonToString(final Map<String, Object?> message) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(message);
  }
}

class _SecurityStorageComponent {
  final FlutterSecureStorage _storage;

  _SecurityStorageComponent()
      : _storage = const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
          ),
        );

  Future<void> write({
    required final LocalSecurityStorageKey key,
    required final String value,
  }) =>
      _storage.write(key: key.key, value: value);

  Future<String?> read(final LocalSecurityStorageKey key) =>
      _storage.read(key: key.key);
}

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sotwo/core/utility/logger/logger.dart';

enum PlatformType {
  android,
  ios,
  ;

  String get value => switch (this) {
        android => 'aos',
        ios => 'ios',
      };
}

class DeviceInformation {
  DeviceInformation() {
    platform = Platform.isAndroid ? PlatformType.android : PlatformType.ios;
  }

  late final PlatformType platform;

  String? _deviceId;
  String? get deviceId => _deviceId;
  String? _appVersion;
  String? get appVersion => _appVersion;

  Future<void> initialize() async {
    _deviceId = await _getDeviceId();
    _appVersion = await _getAppVersion();
  }

  Future<String?> _getDeviceId() async {
    try {
      return Platform.isAndroid
          ? (await DeviceInfoPlugin().androidInfo).id
          : (await DeviceInfoPlugin().iosInfo).identifierForVendor;
    } catch (e, s) {
      Logger.error(
        content: '디바이스 아이디를 가져오는데 실패했습니다.',
        title: 'DeviceInformation.deviceId',
        exception: e,
        stackTrace: s,
      );
      return null;
    }
  }

  Future<String?> _getAppVersion() async {
    try {
      return (await PackageInfo.fromPlatform()).version;
    } catch (e, s) {
      Logger.error(
        content: '앱 버전을 가져오는데 실패했습니다.',
        title: 'DeviceInformation.appVersion',
        exception: e,
        stackTrace: s,
      );
      return null;
    }
  }
}

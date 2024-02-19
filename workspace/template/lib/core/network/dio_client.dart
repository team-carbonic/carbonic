import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:sotwo/core/config/flavor.dart';
import 'package:sotwo/core/network/interceptor/error.dart';
import 'package:sotwo/core/network/interceptor/log.dart';
import 'package:sotwo/core/utility/device_information.dart';

enum HeaderType {
  json,
  jsonWithDeviceInfo,
  ;

  Map<String, String?> get headers {
    switch (this) {
      case json:
        return {
          'Content-Type': 'application/json;charset=UTF-8',
        };
      case jsonWithDeviceInfo:
        final deviceInformation = GetIt.I.get<DeviceInformation>();
        return {
          ...json.headers,
          'xx-device-id': deviceInformation.deviceId,
          'xx-app-version': deviceInformation.appVersion,
          'xx-platform': deviceInformation.platform.value,
        };
    }
  }
}

class DioClient with DioMixin implements Dio {
  DioClient({
    final String? baseUrl,
    required final HeaderType headerType,
  }) {
    options = BaseOptions(
      baseUrl: baseUrl ?? F.flavor.baseServerUrl,
      headers: headerType.headers,
    );

    httpClientAdapter = HttpClientAdapter();

    // 순서가 중요하다.
    interceptors.addAll(
      [
        CustomLogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
        ),
        // AuthInterceptor(this),
        CustomErrorInterceptor(),
      ],
    );

    /// This *must* be the last initialization step of the Dio setup, otherwise
    /// your configuration of Dio might overwrite the Sentry configuration.
    addSentry();
  }
}

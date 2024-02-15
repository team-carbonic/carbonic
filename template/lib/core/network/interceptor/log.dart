import 'dart:convert';

import 'package:sotwo/core/utility/logger/core/core.dart';
import 'package:sotwo/core/utility/logger/logger.dart';
import 'package:dio/dio.dart';

/// [CustomLogInterceptor] is used to print logs during network requests.
/// It's better to add [CustomLogInterceptor] to the tail of the interceptor queue,
/// otherwise the changes made in the interceptor behind A will not be printed out.
/// This is because the execution of interceptors is in the order of addition.
class CustomLogInterceptor extends Interceptor {
  CustomLogInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true,
  });

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var resultLogString = ''._addKeyValue(' - uri', options.uri);
    if (request) {
      resultLogString = resultLogString
          ._addKeyValue(' - method', options.method)
          ._addKeyValue(' - responseType', options.responseType.toString())
          ._addKeyValue(' - followRedirects', options.followRedirects)
          ._addKeyValue(' - method', options.method)
          ._addKeyValue(' - responseType', options.responseType.toString())
          ._addKeyValue(' - followRedirects', options.followRedirects)
          ._addKeyValue(
            ' - persistentConnection',
            options.persistentConnection,
          )
          ._addKeyValue(' - connectTimeout', options.connectTimeout)
          ._addKeyValue(' - sendTimeout', options.sendTimeout)
          ._addKeyValue(' - receiveTimeout', options.receiveTimeout)
          ._addKeyValue(
            ' - receiveDataWhenStatusError',
            options.receiveDataWhenStatusError,
          )
          ._addKeyValue(' - extra', options.extra);
    }
    if (requestHeader) {
      resultLogString = '$resultLogString\n - headers';
      options.headers.forEach(
        (key, value) =>
            resultLogString = resultLogString._addKeyValue('   - $key', value),
      );
    }
    if (requestBody) {
      resultLogString = '$resultLogString\n - data\n';

      if (options.data != null) {
        try {
          resultLogString += _jsonToString(options.data);
        } catch (e, s) {
          Logger.error(
            title: 'json to log string error',
            category: LogCategory.network,
            exception: e,
            stackTrace: s,
          );
          resultLogString += '$_jsonToString function error';
        }
      }
    }
    Logger.info(
      content: resultLogString,
      title: 'Request',
      category: LogCategory.network,
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    var resultLogString =
        ''._addKeyValue(' - uri', response.requestOptions.uri);
    resultLogString += _responseToLogString(response);

    Logger.info(
      content: resultLogString,
      title: 'Response',
      category: LogCategory.network,
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    var resultLogString = '';
    if (error) {
      resultLogString = resultLogString
          ._addKeyValue(' - uri', err.requestOptions.uri)
          ._addKeyValue(' - error', err);
      if (err.response != null) {
        resultLogString += _responseToLogString(err.response!);
      }
      Logger.error(
        content: resultLogString,
        title: 'Error',
        category: LogCategory.network,
      );
    }

    handler.next(err);
  }

  String _responseToLogString(final Response response) {
    var resultLogString = '';
    if (responseHeader) {
      resultLogString =
          resultLogString._addKeyValue(' - statusCode', response.statusCode);
      if (response.isRedirect) {
        resultLogString =
            resultLogString._addKeyValue(' - redirect', response.realUri);
      }

      resultLogString += '\n - headers';
      response.headers.forEach(
        (key, value) => resultLogString =
            resultLogString._addKeyValue('    $key', value.join('\r\n\t')),
      );
    }
    if (responseBody) {
      resultLogString += '\n - responsed json\n';
      if (response.data != null) {
        if (response.data is Map) {
          resultLogString += _jsonToString(response.data);
        } else {
          resultLogString += response.data.toString();
        }
      }
    }
    return resultLogString;
  }

  String _jsonToString(final Map<String, dynamic> data) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(data);
  }
}

extension _StringExtension on String {
  String _addKeyValue(final String key, final Object? value) {
    return '$this\n$key: $value';
  }
}

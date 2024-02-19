import 'package:sotwo/core/network/custom_response.dart';
import 'package:sotwo/core/utility/cast.dart';
import 'package:dio/dio.dart';

class CustomErrorInterceptor extends Interceptor {
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final response = err.response;
    final data = cast<Map>(response?.data);

    if (response == null || data == null) {
      return super.onError(err, handler);
    }

    try {
      final error = CustomResponseError.fromJson(response.data);
      return super.onError(
        CustomResponseException(customError: error, other: err),
        handler,
      );
    } catch (_) {
      return super.onError(err, handler);
    }
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }
}

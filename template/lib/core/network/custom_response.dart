import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_response.g.dart';
part 'custom_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class CustomResponse<T> with _$CustomResponse<T> {
  const CustomResponse._();
  factory CustomResponse({
    final T? data,
  }) = _CustomResponse;

  factory CustomResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$CustomResponseFromJson(json, fromJsonT);

  /// CustomResponse로 특정 내용물을 Wrapping해야 하는 경우 사용한다.
  CustomResponse<D> copyWithT<D>({
    required final D? data,
  }) =>
      CustomResponse<D>(
        data: data,
      );
}

@freezed
class CustomResponseError with _$CustomResponseError {
  factory CustomResponseError({
    @JsonKey(unknownEnumValue: CustomResponseErrorCode.unknown)
    required final CustomResponseErrorCode code,
    final String? message,
    final Map<String, dynamic>? detail,
  }) = _CustomResponseError;

  factory CustomResponseError.fromJson(Map<String, dynamic> json) =>
      _$CustomResponseErrorFromJson(json);
}

class CustomResponseException extends DioException {
  final CustomResponseError customError;

  CustomResponseException({
    required this.customError,
    required final DioException other,
  }) : super(
          requestOptions: other.requestOptions,
          error: other.error,
          type: other.type,
          message: other.message,
          stackTrace: other.stackTrace,
          response: other.response,
        );
}

@JsonEnum(valueField: 'code')
enum CustomResponseErrorCode {
  // default value when not found
  unknown('unknown'),
  ;

  final String code;
  const CustomResponseErrorCode(this.code);
}

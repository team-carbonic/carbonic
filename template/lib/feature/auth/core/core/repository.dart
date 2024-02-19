import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sotwo/core/network/custom_response.dart';

part 'repository.freezed.dart';
part 'repository.g.dart';

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(final Dio dio) = _AuthRepository;

  @POST('/api/v1/auth/ci')
  Future<CustomResponse<DeviceSabIdResponse>> getDeviceSabId();
}

@freezed
class DeviceSabIdResponse with _$DeviceSabIdResponse {
  factory DeviceSabIdResponse({
    @JsonKey(name: 'ci') required final String id,
    @JsonKey(name: 'newDevice') required final bool isNewDevice,
  }) = _DeviceSabIdResponse;

  factory DeviceSabIdResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceSabIdResponseFromJson(json);
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sotwo/core/network/dio_client.dart';
import 'package:sotwo/core/utility/local_storage/manager.dart';
import 'package:sotwo/feature/auth/core/core/repository.dart';

part 'device_sab_id.g.dart';

@Riverpod(keepAlive: true)
class DeviceSabId extends _$DeviceSabId {
  @override
  Future<DeviceSabIdResponse?> build() async {
    final id = await LocalStorageManager.securityStorage
        .read(LocalSecurityStorageKey.deviceSabId);

    if (id != null) {
      return DeviceSabIdResponse(
        id: id,
        isNewDevice: false,
      );
    }

    final response = await AuthRepository(
      DioClient(
        headerType: HeaderType.jsonWithDeviceInfo,
      ),
    ).getDeviceSabId();

    final data = response.data;
    if (data != null) {
      LocalStorageManager.securityStorage
          .write(key: LocalSecurityStorageKey.deviceSabId, value: data.id);
      return data;
    }

    return null;
  }
}

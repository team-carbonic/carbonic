import 'package:permission_handler/permission_handler.dart';
import 'package:sotwo/core/utility/logger/core/core.dart';
import 'package:sotwo/core/utility/logger/logger.dart';

class PermissionManager {
  static Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isDenied) {
      await Permission.notification.request();
    }
    Logger.info(
      content: 'status: ${status.name}',
      title: 'Notification Permission',
      category: LogCategory.permission,
    );
  }
}

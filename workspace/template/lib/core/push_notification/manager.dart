import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sotwo/core/utility/logger/core/core.dart';
import 'package:sotwo/core/utility/logger/logger.dart';

class LocalNotificationManager {
  static const androidChannel = AndroidNotificationChannel(
    'SAB_NOTIFICATION_CHANNEL_0',
    'SAB Notification 0',
    importance: Importance.max,
  );

  static Future<void> initialize() async {
    await _initializePlugin();
  }

  static Future<void> _initializePlugin() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('ic_stat_sotwo_symbol');
    const initializationSettingsDarwin = DarwinInitializationSettings(
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await FlutterLocalNotificationsPlugin().initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );

    await FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);
  }

  /// ? iOS 10미만에만 적용인데 필요할까?
  static void _onDidReceiveLocalNotification(
    final int id,
    final String? title,
    final String? body,
    final String? payload,
  ) {
    Logger.info(
      content: '_onDidReceiveLocalNotification - '
          'id: $id, title: $title, body: $body, payload: $payload',
      title: 'PushNotificationManager',
      category: LogCategory.notification,
    );

    // TODO : 딥링크 처리
  }

  /// 포그라운드에서 알림을 터치한 경우
  static void _onDidReceiveNotificationResponse(
    final NotificationResponse response,
  ) {
    Logger.info(
      content: '_onDidReceiveNotificationResponse - '
          'id: ${response.id}, '
          'actionId: ${response.actionId}, '
          'input: ${response.input}, '
          'payload: ${response.payload}',
      title: 'PushNotificationManager',
      category: LogCategory.notification,
    );

    // TODO : 딥링크 처리
  }
}

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sotwo/core/push_notification/manager.dart';
import 'package:sotwo/core/utility/logger/core/core.dart';
import 'package:sotwo/core/utility/logger/logger.dart';

class FcmManager {
  static StreamSubscription<RemoteMessage>? onMessageOpenedAppHandler;
  static StreamSubscription<RemoteMessage>? onMessageHandler;

  static Future<void> initialize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static Future<void> onLogin() async {
    await _initializeOnLogin();
    await _registerHanders();
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleInitialMessage(initialMessage);
    }
  }

  static void onLogout() {
    _disposeHandlers();
  }

  static void onUnregister() {
    _disposeHandlers();
  }

  static Future<void> _registerHanders() async {
    _disposeHandlers();
    onMessageOpenedAppHandler =
        FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
    onMessageHandler = FirebaseMessaging.onMessage.listen(_onMessage);
  }

  static void _disposeHandlers() {
    onMessageOpenedAppHandler?.cancel();
    onMessageOpenedAppHandler = null;
    onMessageHandler?.cancel();
    onMessageHandler = null;
  }

  static Future<void> _initializeOnLogin() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    Logger.info(
      content: 'FCM Token: $fcmToken',
      title: 'FcmManager',
      category: LogCategory.notification,
    );
    // TODO : 서버에 fcmToken 전송
  }

  /// 앱이 종료된 상태에서 알림을 터치하여 앱을 실행한 경우
  static void _handleInitialMessage(final RemoteMessage message) {
    Logger.info(
      content: 'from getInitialMessage() - message.data: ${message.data}',
      title: 'FcmManager',
      category: LogCategory.notification,
    );
    _handleMessage(message);
  }

  /// - 백그라운드 실행 중에 알림을 터치하여 앱을 실행한 경우
  /// - iOS의 경우, 포그라운드에서 알림을 터치한 경우
  static void _onMessageOpenedApp(final RemoteMessage message) {
    Logger.info(
      content: 'from onMessageOpenedApp - message.data: ${message.data}',
      title: 'FcmManager',
      category: LogCategory.notification,
    );
    _handleMessage(message);
  }

  /// 포그라운드에서 알림이 도착한 경우 (터치하지 않아도 실행)
  static void _onMessage(final RemoteMessage message) {
    Logger.info(
      content:
          'from onMessage - message.hashCode: ${message.notification.hashCode}, message.data: ${message.data}',
      title: 'FcmManager',
      category: LogCategory.notification,
    );
    if (message.notification != null && message.notification!.android != null) {
      _onMessageOnAndroid(message.notification!);
    }
  }

  /// - 안드로이드의 경우, 포그라운드에서 FCM 시스템으로는 알림 표시 불가능
  /// - 받은 FCM 콘텐츠를 [LocalNotificationManager]에 전달하여 알림 표시 및 처리 진행
  /// - 알림 터치 시 [LocalNotificationManager._onDidReceiveNotificationResponse] 함수로 진입
  static void _onMessageOnAndroid(final RemoteNotification notification) {
    FlutterLocalNotificationsPlugin().show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          LocalNotificationManager.androidChannel.id,
          LocalNotificationManager.androidChannel.name,
        ),
      ),
    );
  }

  static void _handleMessage(final RemoteMessage message) {
    // TODO : 딥링크 처리
  }
}

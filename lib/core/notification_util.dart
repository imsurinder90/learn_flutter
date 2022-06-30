import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationUtil {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static late NotificationDetails platformChannelSpecifics;

  static void selectNotification(String? payload) async {
    //Handle notification tapped logic here
  }

  static Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notify_icon');

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, macOS: null);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails("hi", "hello",
            importance: Importance.max, priority: Priority.defaultPriority);

    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
  }
}

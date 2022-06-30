import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:learn_flutter/core/navigation_sevice.dart';
import 'package:learn_flutter/pages/show_daily_quotes.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  // Singleton pattern
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = "1";

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    channelId,
    "lifechangingquotes",
    channelDescription: "Life Changing Motivational quotes for all",
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
    styleInformation: BigTextStyleInformation(''),
  );

  AndroidNotificationDetails setAndNotBigDetails(String text) {
    return AndroidNotificationDetails(
      channelId,
      "lifechangingquotes",
      channelDescription: "Life Changing Motivational quotes for all",
      playSound: true,
      priority: Priority.high,
      importance: Importance.high,
      styleInformation: BigTextStyleInformation(text),
    );
  }

  final NotificationDetails notificationDetails =
      NotificationDetails(android: _androidNotificationDetails);

  Future<FlutterLocalNotificationsPlugin> init() async {
    final AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    final InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    // *** Initialize timezone here ***
    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
    return flutterLocalNotificationsPlugin;

    // final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    //     await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    // String? payload = notificationAppLaunchDetails!.payload;
    // print("payload: $payload");
    // if (payload != null) {
    //   onSelectNotification(payload);
    // }
  }

  Future<void> showNotification(
      int id, String title, String body, String payload) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> scheduleFiveSecondNotification(int id, String title, String body,
      NotificationDetails myNotificationDetails, int duration) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(Duration(seconds: duration)),
        myNotificationDetails,
        payload: body,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  tz.TZDateTime _nextInstanceOfNineAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 09);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> scheduleDailyNineAMNotification(int id, String title,
      String body, NotificationDetails myNotificationDetails) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id, title, body, _nextInstanceOfNineAM(), myNotificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> onSelectNotification(String? payload) async {
    await NavigationService.instance.navigateTo(
        MaterialPageRoute(builder: (_) => DailyQuotes(payload: payload)));
  }
}

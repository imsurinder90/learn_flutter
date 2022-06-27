import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:learn_flutter/core/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    // fiveSecond();
  }

  Future<void> onCreate() async {
    await notificationService.showNotification(
        1,
        "Life Changing Motivational Quotes",
        "Life is very simple if we think properly.",
        "oh okay");
  }

  // Future<void> fiveSecond(String title, String msg) async {
  //   final NotificationDetails myNotificationDetails = NotificationDetails(
  //       android: notificationService.setAndNotBigDetails(msg));
  //   await notificationService.scheduleFiveSecondNotification(
  //     1,
  //     title,
  //     msg,
  //     myNotificationDetails,
  //   );
  // }

  Future<void> scheduleDailyNineAM(String title, String msg) async {
    final NotificationDetails myNotificationDetails = NotificationDetails(
        android: notificationService.setAndNotBigDetails(msg));
    await notificationService.scheduleDailyNineAMNotification(
      1,
      title,
      msg,
      myNotificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
          padding: EdgeInsets.all(25),
          child: ElevatedButton(
              onPressed: () async {
                // onCreate();
                String title = "Daily Motivation";
                String msg =
                    "Subah, Don't let the expectations and opinions of other people affect your decisions. It's your life, not theirs. Do what matters most to you; do what makes you feel alive and happy.\r\n\r\nTap here to read latest movtivational quotes.";
                scheduleDailyNineAM(title, msg);
              },
              child: Text("hey"))),
    ));
  }
}

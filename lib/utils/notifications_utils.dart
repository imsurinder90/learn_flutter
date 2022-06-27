import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter/core/notification_service.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';
import 'package:learn_flutter/utils/utilities.dart';

class NotificationsUtils {
  NotificationService notificationService = NotificationService();

  scheduleDailyQuotes() async {
    // notificationService.cancelAllNotifications();
    UserSharedPrefernces.clearDailyQuote();
    List<String> dQuotes = UserSharedPrefernces.getDailyQuote();
    String lstDayFetched = UserSharedPrefernces.getlastDayFetched();
    DateTime lstDayFetchedObject = lstDayFetched.isNotEmpty
        ? DateFormat("yyyy-MM-dd").parse(lstDayFetched)
        : DateTime.now();
    // DateTime lstDayFetchedObject = DateTime(2022, 05, 26);
    print("isempty: ${dQuotes.isEmpty}");
    print(UserSharedPrefernces.getDailyQuote().length);
    print(
        "date diff ${UserSharedPrefernces.daysBetween(DateTime.now(), lstDayFetchedObject).abs()}");
    if (dQuotes.isEmpty ||
        (lstDayFetched.isNotEmpty &&
            UserSharedPrefernces.daysBetween(
                        DateTime.now(), lstDayFetchedObject)
                    .abs() >
                30)) {
      print("inside this");

      await getDailyQuotes();

      UserSharedPrefernces.setlastDayFetched();
    }
  }

  getDailyQuotes() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    int docLimit = 4;
    const String title = "Daily Motivation Quotes";

    var quotes = db.collection("dailyquotes");
    var key = quotes.doc().id;
    int sec = 0;

    quotes
        .where(FieldPath.documentId, isGreaterThanOrEqualTo: key)
        .limit(docLimit)
        .get()
        .then((QuerySnapshot snapshot) {
      if (snapshot.size > 0) {
        snapshot.docs.forEach((doc) async {
          try {
            sec += 30;
            print("${doc.id}, '=>', ${doc.data()}");
            String text = doc.data().toString().contains('text')
                ? doc['text']
                : 'no data';
            if (text.isNotEmpty) {
              await UserSharedPrefernces.saveDailyQuote(text);
              await fiveSecond(Utilities.getRandomNo(), title, text, sec);
            }
          } catch (e) {
            print(e.toString());
          }
        });
      } else {
        var quote = quotes
            .where(FieldPath.documentId, isLessThan: key)
            .limit(docLimit)
            .get()
            .then((QuerySnapshot snapshot) {
          snapshot.docs.forEach((doc) async {
            try {
              sec += 30;
              print("${doc.id}, '=>', ${doc.data()}");
              String text = doc.data().toString().contains('text')
                  ? doc['text']
                  : 'no data';
              if (text.isNotEmpty) {
                await UserSharedPrefernces.saveDailyQuote(text);
                await fiveSecond(Utilities.getRandomNo(), title, text, sec);
              }
            } catch (e) {
              print(e.toString());
            }
          });
        });
      }
    });
  }

  Future<void> fiveSecond(
      int channelId, String title, String msg, int seconds) async {
    final NotificationDetails myNotificationDetails = NotificationDetails(
        android: notificationService.setAndNotBigDetails(msg));
    await notificationService.scheduleFiveSecondNotification(
        channelId, title, msg, myNotificationDetails, seconds);
  }
}

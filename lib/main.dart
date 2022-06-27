import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter/core/navigation_sevice.dart';
import 'package:learn_flutter/core/notification_service.dart';
import 'package:learn_flutter/core/notification_util.dart';
import 'package:learn_flutter/pages/favorites_page.dart';

import 'package:learn_flutter/pages/image_quote_page.dart';
import 'package:learn_flutter/pages/my_test_page.dart';
import 'package:learn_flutter/pages/text_quote.dart';
import 'package:learn_flutter/utils/notifications_utils.dart';
import 'package:learn_flutter/utils/routes.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await UserSharedPrefernces.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NavigationService nService = NavigationService();
  NotificationsUtils nUtils = NotificationsUtils();

  @override
  void initState() {
    super.initState();
    nUtils.notificationService.init();
    nUtils.scheduleDailyQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
        // home: DestinationScreen(),
        home: ImageQuotePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: GoogleFonts.lato().fontFamily,
            tabBarTheme: TabBarTheme(
                labelColor: Colors.pink[800],
                labelStyle:
                    TextStyle(color: Colors.pink[800]), // color for text
                indicator: UnderlineTabIndicator(
                    // color for indicator (underline)
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 3))),
            primaryColor: Colors.pink[800] // deprecated,
            ),
        // theme: ThemeData(
        //     primarySwatch: Colors.purple,
        //     fontFamily: GoogleFonts.lato().fontFamily),
        // initialRoute: MyRoutes.favQuoteRoute,
        routes: {
          MyRoutes.imageQuoteRoute: (context) => ImageQuotePage(),
          MyRoutes.textQuoteRoute: (context) => TextQuote(),
          MyRoutes.favQuoteRoute: (context) => FavoritePage(),
        });
  }
}

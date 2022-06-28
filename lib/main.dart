import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter/core/navigation_sevice.dart';
import 'package:learn_flutter/core/notification_service.dart';
import 'package:learn_flutter/core/notification_util.dart';
import 'package:learn_flutter/pages/favorites_page.dart';
import 'package:learn_flutter/pages/image_quote_page.dart';
import 'package:learn_flutter/pages/my_test_page.dart';
import 'package:learn_flutter/pages/second_page.dart';
import 'package:learn_flutter/pages/settings_page.dart';
import 'package:learn_flutter/pages/text_quote.dart';
import 'package:learn_flutter/utils/notifications_utils.dart';
import 'package:learn_flutter/utils/routes.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:learn_flutter/utils/utilities.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: NavigationService.instance.navigationKey,
        home: HomePage(),
        routes: {
          MyRoutes.imageQuoteRoute: (context) => ImageQuotePage(),
          MyRoutes.textQuoteRoute: (context) => TextQuote(),
          MyRoutes.favQuoteRoute: (context) => FavoritePage(),
          MyRoutes.dailyQuoteRoute: (context) => DailyQuotes(
                payload:
                    "There is a road from the eye to the heart that does not go through the intellect.",
              ),
        });
    // return MaterialApp(
    //   // navigatorKey: NavigationService.instance.navigationKey,
    //   // home: DestinationScreen(),
    //   home: ImageQuotePage(),
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //       brightness: Brightness.light,
    //       fontFamily: GoogleFonts.lato().fontFamily,
    //       tabBarTheme: TabBarTheme(
    //           labelColor: Colors.pink[800],
    //           labelStyle: TextStyle(color: Colors.pink[800]), // color for text
    //           indicator: UnderlineTabIndicator(
    //               // color for indicator (underline)
    //               borderSide:
    //                   BorderSide(color: Colors.orangeAccent, width: 3))),
    //       primaryColor: Colors.pink[800] // deprecated,
    //       ),

    //   // theme: ThemeData(
    //   //     primarySwatch: Colors.purple,
    //   //     fontFamily: GoogleFonts.lato().fontFamily),
    //   // initialRoute: MyRoutes.favQuoteRoute,
    //   // routes: {
    //   //   MyRoutes.imageQuoteRoute: (context) => ImageQuotePage(),
    //   //   MyRoutes.textQuoteRoute: (context) => TextQuote(),
    //   //   MyRoutes.favQuoteRoute: (context) => FavoritePage(),
    //   // }
    // );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  NotificationsUtils nUtils = NotificationsUtils();

  bool showDailyNotify = UserSharedPrefernces.getDailyNotify();
  String? payload;

  final screens = [
    ImageQuotePage(),
    TextQuote(),
    FavoritePage(),
    SettingsPage()
  ];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => mycallback());
    showDailyQuote();
  }

  showDailyQuote() {
    if (showDailyNotify) {
      nUtils.scheduleDailyQuotes();
      // if (notificationAppLaunchDetails != null) {
      //   setState(() {
      //     payload = notificationAppLaunchDetails.payload;
      //   });
      // }
      // setState(() {
      //   pgPayload = (payload != null) ? payload : "";
      // });
    }
  }

  mycallback() async {
    var payload = "";
    FlutterLocalNotificationsPlugin fLNP =
        await nUtils.notificationService.init();

    final notificationAppLaunchDetails =
        await fLNP.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails != null) {
      String? pl = notificationAppLaunchDetails.payload;
      payload = (pl != null) ? pl : payload;
    }

    if (payload.isNotEmpty) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
        return DailyQuotes(payload: payload);
      }), ((route) => route.isFirst));
    }

    // await nUtils.notificationService.init().then((value1) async {
    //   await value1.getNotificationAppLaunchDetails().then((value) {
    //     print(value);
    //     if (value != null) {
    //       payload = value.payload;
    //       // setState(() {
    //       //   payload = value.payload;
    //       // });
    //       // payload = value.payload;
    //     } else {
    //       payload = "it wa snull";
    //     }
    //   });
    // });
    // return payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: LazyLoadIndexedStack(index: currentIndex, children: screens),
        // pgPayload.isNotEmpty
        //     ? DailyQuotes(
        //         payload: pgPayload,
        //       )
        //     : LazyLoadIndexedStack(index: currentIndex, children: screens),
        // child: (currentIndex != 2)
        //     ? IndexedStack(
        //         index: currentIndex,
        //         children: screens,
        //       )
        //     : screens[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: 'Text Quote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_rounded),
            label: 'Bookmarked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

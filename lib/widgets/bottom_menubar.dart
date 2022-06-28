import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/favorites_page.dart';
import 'package:learn_flutter/pages/image_quote_page.dart';
import 'package:learn_flutter/pages/text_quote.dart';
import 'package:learn_flutter/utils/routes.dart';

class BottonNavigationWidget extends StatefulWidget {
  final Function(int)? func;
  const BottonNavigationWidget({Key? key, this.func}) : super(key: key);

  @override
  State<BottonNavigationWidget> createState() => _BottonNavigationWidgetState();
}

class _BottonNavigationWidgetState extends State<BottonNavigationWidget> {
  int _index = 0;

  _BottonNavigationWidgetState();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (newIndex) async {
        // setState(() async {
        //   _index = newIndex;
        // });

        // switch (newIndex) {
        //   case 0:
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => const ImageQuotePage()));
        //     break;
        //   case 1:
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => const TextQuote()));
        //     break;
        //   case 2:
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => const FavoritePage()));
        //     break;
        //   default:
        //     break;
        // }
      },
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
      ],
    );
  }
}



  // String getPayload() {
  //   var payload = "no data yet";
  //   await nUtils.notificationService.init().then((value1) async {
  //     await value1.getNotificationAppLaunchDetails().then((value) {
  //       print(value);
  //       if (value != null) {
  //         payload = value.payload;
  //         // setState(() {
  //         //   payload = value.payload;
  //         // });
  //         // payload = value.payload;
  //       } else {
  //         payload = "it wa snull";
  //       }
  //     });
  //   });
  //   return payload;
  // }


  //   showDailyQuote() async {
  //   if (showDailyNotify) {
  //     FlutterLocalNotificationsPlugin fLNP =
  //         await nUtils.notificationService.init();
  //     nUtils.scheduleDailyQuotes();

  //     final notificationAppLaunchDetails =
  //         await fLNP.getNotificationAppLaunchDetails();

  //     if (notificationAppLaunchDetails != null) {
  //       String? payload = notificationAppLaunchDetails.payload;
  //       pgPayload = (payload != null) ? payload : "";
  //     }
  //     // setState(() {
  //     //   pgPayload = (payload != null) ? payload : "";
  //     // });
  //   }
  // }
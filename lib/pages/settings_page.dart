import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter/theme/themes.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';
import 'package:learn_flutter/utils/utilities.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isToggled = UserSharedPrefernces.getDailyNotify();
  static String pageTitle = "Settings";
  static String sendFeedback = 'Send feedback';
  static String dailyQuotesReminder = 'Daily Quotes Reminder';
  static String dailyQuotesDetails =
      'Helps you to keep energized and motivated throughout the day';
  static String rateOnPlayStore = 'Rate on Play Store';
  static String rateOnPlayStoreDetails =
      'Your feedback and rating will be helpful to keep us improving the app and a boost in the motivation to deliver best.';

  @override
  Widget build(BuildContext context) {
    // currentTheme.switchStatusBarStyle(context, 3);
    currentTheme.switchStatusBarStyle(
        context, 2); // #TODO: there is bug due to this
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.appBarBgColor,
        title: Text(pageTitle),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).bottomAppBarColor,
        child: ListView(
          children: [
            Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  // side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: SwitchListTile(
                    secondary: Icon(
                      _isToggled
                          ? Icons.notifications_active
                          : Icons.notifications,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: Text(dailyQuotesReminder),
                    subtitle: Text(dailyQuotesDetails),
                    value: _isToggled,
                    onChanged: (bool value) {
                      UserSharedPrefernces.setDailyNotify(value);
                      setState(() {
                        _isToggled = value;
                      });
                    })),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                // side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(rateOnPlayStore),
                subtitle: Text(rateOnPlayStoreDetails),
                trailing: Icon(
                  Icons.link,
                  color: Theme.of(context).iconTheme.color,
                ),
                onTap: () {
                  // Utilities.mSnackBar(context, "Clicked on Rate Play Store");
                  Utilities.rateOnPlayStore();
                },
              ),
            ),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                // side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(sendFeedback),
                trailing: Icon(
                  Icons.link,
                  color: Theme.of(context).iconTheme.color,
                ),
                onTap: () {
                  Utilities.sendEmail();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

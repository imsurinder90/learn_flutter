import 'package:flutter/material.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';
import 'package:learn_flutter/utils/utilities.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isToggled = UserSharedPrefernces.getDailyNotify();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings"),
          automaticallyImplyLeading: false,
          elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
              elevation: 1,
              child: SwitchListTile(
                  secondary: Icon(Icons.timelapse_outlined),
                  title: Text('Daily Quotes Reminder'),
                  subtitle: Text(
                      'Helps you to keep energized and motivated throughout the day'),
                  value: _isToggled,
                  onChanged: (bool value) {
                    UserSharedPrefernces.setDailyNotify(value);
                    setState(() {
                      _isToggled = value;
                    });
                  })),
          Card(
            elevation: 1,
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text('Rate on Play Store'),
              subtitle: Text(
                  'Your feedback and rating will be helpful to keep us improving the app and a boost in the motivation to deliver best.'),
              trailing: Icon(Icons.link),
              onTap: () {
                // Utilities.mSnackBar(context, "Clicked on Rate Play Store");
                Utilities.rateOnPlayStore();
              },
            ),
          ),
          Card(
            elevation: 1,
            child: ListTile(
              leading: Icon(Icons.mail),
              title: Text('Send feedback'),
              trailing: Icon(Icons.link),
              onTap: () {
                Utilities.sendEmail();
              },
            ),
          ),
        ],
      ),
    );
  }
}

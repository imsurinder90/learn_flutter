import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.light(
          primary: Color.fromARGB(255, 248, 137, 93), // swipe refresh icon
          secondary: Colors.white // scroll overflow
          ),
      primaryColor: Colors.white,
      brightness: Brightness.light,
      canvasColor: Colors.white,
      // scaffoldBackgroundColor: Colors.purpleAccent,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Color.fromARGB(255, 248, 137, 93), // swipe refresh icon
          secondary: Colors.grey[850]!, // scroll overflow
        ),
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey.shade600,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.grey));
  }

  switchStatusBarStyle(context, index) {
    switch (index) {
      case 0:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.statusBarPg1BgColor,
            statusBarIconBrightness:
                Theme.of(context).colorScheme.statusBarPg1Brightness));
        break;
      case 1:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.statusBarPg1BgColor,
            statusBarIconBrightness:
                Theme.of(context).colorScheme.statusBarPg1Brightness));
        break;
      case 2:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.statusBarPg3BgColor,
            statusBarIconBrightness:
                Theme.of(context).colorScheme.statusBarPg1Brightness));
        break;
      case 3:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).colorScheme.statusBarPg3BgColor,
            statusBarIconBrightness:
                Theme.of(context).colorScheme.statusBarPg1Brightness));
        break;
      default:
    }
  }
}

// access with Theme.of(context).colorScheme.appBarBgColor
extension ColorSchemeExtension on ColorScheme {
  Color get appBarBgColor =>
      brightness == Brightness.light ? Colors.blueGrey : Colors.grey[850]!;
  Color get tabBarIndicatorColor =>
      brightness == Brightness.light ? Color(0xffF15C22) : Color(0xffF15C22);
  Color get bottomNavBarColor => brightness == Brightness.light
      ? Color.fromARGB(255, 248, 137, 93)
      : Color.fromARGB(255, 248, 137, 93);
  Color get snackBarTextColor =>
      brightness == Brightness.light ? Colors.white : Colors.black;
  Color get snackBarBgColor =>
      brightness == Brightness.light ? Colors.black : Colors.white;

  // colors for status bar
  Color get statusBarPg1BgColor =>
      brightness == Brightness.light ? Colors.white : Colors.grey[850]!;
  // colors for status bar
  Brightness get statusBarPg1Brightness =>
      brightness == Brightness.light ? Brightness.dark : Brightness.light;
  Color get statusBarPg3BgColor =>
      brightness == Brightness.light ? Colors.blueGrey : Colors.grey[850]!;
}

import 'package:flutter/material.dart';

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
}

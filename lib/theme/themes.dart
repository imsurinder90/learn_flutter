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
      colorScheme: ColorScheme.light(),
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: Colors.redAccent,
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
        colorScheme: ColorScheme.dark(),
        primaryColor: Colors.black,
        backgroundColor: Colors.grey,
        scaffoldBackgroundColor: Colors.grey.shade600,
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white));
  }
}

// access with Theme.of(context).colorScheme.appBarBgColor
extension ColorSchemeExtension on ColorScheme {
  Color get appBarBgColor =>
      brightness == Brightness.light ? Colors.blueGrey : Colors.grey[800]!;
}

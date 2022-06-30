import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPrefernces {
  static late SharedPreferences _preferences;
  static String imgKey = "imgKey";
  static String textKey = "textKey";
  static String lastDayFetched = "lastDayFetched";
  static String dailyQuotes = "dailyQuotes";
  static String dailyNotify = "dailyNotify";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Notifications method
  static bool getDailyNotify() {
    return _preferences.getBool(dailyNotify) ?? false;
  }

  static setDailyNotify(bool value) {
    return _preferences.setBool(dailyNotify, value);
  }

  // lastdayfetched method
  static String getCurrentDay() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static String getlastDayFetched() {
    return _preferences.getString(lastDayFetched) ?? "";
  }

  static setlastDayFetched() {
    _preferences.setString(lastDayFetched, getCurrentDay());
  }

  // Image qutoes method
  static List<String> getDailyQuote() {
    return _preferences.getStringList(dailyQuotes) ?? [];
  }

  static clearDailyQuote() {
    _preferences.setStringList(dailyQuotes, []);
  }

  static saveDailyQuote(String data) {
    // _preferences.setStringList(dailyQuotes, []);
    List<String> myDailyQuotes = _preferences.getStringList(dailyQuotes) ?? [];
    myDailyQuotes.add(data);
    _preferences.setStringList(dailyQuotes, myDailyQuotes);
  }

  // Image qutoes method
  static List<String> getImgQuote() {
    return _preferences.getStringList(imgKey) ?? [];
  }

  static saveImgQuote(String data) {
    // _preferences.setStringList(imgKey, []);
    List<String> imgQuotes = _preferences.getStringList(imgKey) ?? [];
    imgQuotes.add(data);
    _preferences.setStringList(imgKey, imgQuotes);
  }

  static removeImgQuote(String data) {
    List<String> imgQuotes = _preferences.getStringList(imgKey) ?? [];
    imgQuotes.removeWhere((element) => element == data);
    _preferences.setStringList(imgKey, imgQuotes);
  }

  static removeAllImgQutoes() {
    _preferences.setStringList(imgKey, []);
  }

  // Text qutoes method
  static List<String> getTextQuote() {
    return _preferences.getStringList(textKey) ?? [];
  }

  static saveTextQuote(String data) {
    List<String> textQuotes = _preferences.getStringList(textKey) ?? [];
    textQuotes.add(data);
    _preferences.setStringList(textKey, textQuotes);
  }

  static removeTextQuote(String data) {
    List<String> textQuotes = _preferences.getStringList(textKey) ?? [];
    textQuotes.removeWhere((element) => element == data);
    _preferences.setStringList(textKey, textQuotes);
  }

  static removeAllTextQutoes() {
    _preferences.setStringList(textKey, []);
  }
}

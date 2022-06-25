import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPrefernces {
  static late SharedPreferences _preferences;
  static String imgKey = "imgKey";
  static String textKey = "textKey";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

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

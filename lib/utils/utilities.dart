import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Utilities {
  static int getRandomNo() {
    var random = Random();
    return random.nextInt(pow(2, 31).toInt() - 1);
  }

  static int getRandomInRange(int from, int to) {
    Random random = new Random();
    return random.nextInt(to) + from; // from 10 upto 99 included
  }

  static String uuid2() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  /// Construct a color from a hex code string, of the format #RRGGBB.
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static void rateOnPlayStore() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String appPackageName = packageInfo.appName;
    String appPackageName = "net.sumitk.quotesmeditation";
    try {
      launchUrl(Uri.parse("market://details?id=$appPackageName"));
    } on PlatformException catch (e) {
      launchUrl(Uri.parse(
          "https://play.google.com/store/apps/details?id=$appPackageName"));
    } finally {
      launchUrl(Uri.parse(
          "https://play.google.com/store/apps/details?id=$appPackageName"));
    }
  }

  static void sendEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'srana977@gmail.com',
    );
    String url = params.toString();
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      print('Could not launch $url');
    }
  }

  static mSnackBar(context, msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: ui.Color.fromARGB(255, 39, 34, 34),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'X',
        onPressed: () {},
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Text(msg),
      duration: Duration(seconds: 1),
    ));
  }

  static formatNumber(dynamic myNumber) {
    // Convert number into a string if it was not a string previously
    String stringNumber = myNumber.toString();

    // Convert number into double to be formatted.
    // Default to zero if unable to do so
    double doubleNumber = double.tryParse(stringNumber) ?? 0;

    // Set number format to use
    NumberFormat numberFormat = NumberFormat.compact();

    return numberFormat.format(doubleNumber).toString();
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

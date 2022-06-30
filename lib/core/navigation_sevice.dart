import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String _rn) {
    return navigationKey.currentState!.pushReplacementNamed(_rn);
  }

  Future<dynamic> navigateTo(Route _rn) {
    // Route<dynamic> rt = MaterialPageRoute(builder: (_) => ImageQuotePage());
    return navigationKey.currentState!
        .pushAndRemoveUntil(_rn, (route) => route.isFirst);

    // ModalRoute.withName(
    //     '/imagequote') // Replace this with your root screen's route name (usually '/')
    // );

    // navigationKey.currentState!.popUntil(ModalRoute.withName('/dailyquote'));
    // return navigationKey.currentState!.push(_rn).then((value) => null);
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute _rn) {
    return navigationKey.currentState!.push(_rn);
  }

  goback() {
    return navigationKey.currentState!.pop();
  }
}

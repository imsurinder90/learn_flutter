import 'package:flutter/material.dart';
import 'package:learn_flutter/theme/themes.dart';

class QuotesAppTitle extends StatelessWidget {
  const QuotesAppTitle({Key? key}) : super(key: key);
  static String mainAppTitle = "Best Motivation Quotes";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Theme.of(context).canvasColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 7, left: 10, bottom: 0),
              child: Text(mainAppTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
          IconButton(
            icon: const Icon(Icons.brightness_4_rounded),
            onPressed: () {
              currentTheme.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}

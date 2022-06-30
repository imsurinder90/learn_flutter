import 'package:flutter/material.dart';
import 'package:learn_flutter/theme/themes.dart';

class QuotesAppTitle extends StatelessWidget {
  const QuotesAppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 7, left: 10, bottom: 0),
              child: Text("Best Motivation Quotes",
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

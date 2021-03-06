import 'package:flutter/material.dart';
import 'package:learn_flutter/models/text_quote_model.dart';
import 'package:learn_flutter/theme/themes.dart';
import 'package:learn_flutter/utils/gradient_colors.dart';
import 'package:learn_flutter/utils/utilities.dart';
import 'package:learn_flutter/widgets/text_quote_btns.dart';
import 'package:learn_flutter/widgets/text_quote_pic.dart';

class DailyQuotes extends StatelessWidget {
  final String? payload;
  DailyQuotes({Key? key, required this.payload}) : super(key: key);
  List<GlobalKey> renderKeys = List<GlobalKey<FormState>>.generate(
      1, (i) => GlobalKey<FormState>(debugLabel: ' _quote_details_Key'));

  static String showDailyQuotesTitle = "Daily Motivational Quotes";

  void callbackMethod() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(showDailyQuotesTitle),
          backgroundColor: Theme.of(context).colorScheme.appBarBgColor,
        ),
        body: SafeArea(
            child: Container(
          color: Theme.of(context).bottomAppBarColor,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          height: MediaQuery.of(context).size.height,
          child: (payload != null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextQuotePic(
                        itemKey: renderKeys[0],
                        item: TextQuote(
                            id: "1",
                            text: payload!,
                            category: "Daily Quotes",
                            author: "Unknown",
                            likes: Utilities.getRandomInRange(2000, 8000),
                            colors: GColors.getRandomColorAsString())),
                    TextQuoteBtns(
                        itemKey: renderKeys[0],
                        item: TextQuote(
                            id: "1",
                            text: payload!,
                            category: "Daily Quotes",
                            author: "Unknown",
                            likes: Utilities.getRandomInRange(2000, 8000),
                            colors: GColors.getRandomColorAsString()),
                        screenName: "quote_details",
                        callbackMethod: callbackMethod)
                  ],
                )
              : Container(),
        )));
  }
}

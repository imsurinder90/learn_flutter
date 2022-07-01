// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/text_quote_btns.dart';
import 'package:learn_flutter/widgets/text_quote_pic.dart';

class TextQuoteListView extends StatelessWidget {
  final data;
  final bool hasNext;
  final ScrollController controller;
  final renderKeys;
  final String screenName;
  final Function callbackMethod;

  TextQuoteListView(
      {Key? key,
      required this.data,
      required this.hasNext,
      required this.controller,
      required this.renderKeys,
      required this.screenName,
      required this.callbackMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller,
        itemCount: data.length + 1,
        itemBuilder: (context, index) {
          if (index < data.length) {
            return Container(
              margin: EdgeInsets.only(bottom: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextQuotePic(itemKey: renderKeys[index], item: data[index]),
                  TextQuoteBtns(
                      itemKey: renderKeys[index],
                      item: data[index],
                      screenName: screenName,
                      callbackMethod: callbackMethod)
                ],
              ),
            );
          } else {
            // return Container();
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: hasNext ? CircularProgressIndicator() : Container(),
              ),
            );
          }
        });
  }
}

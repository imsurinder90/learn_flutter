import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/core/image_db.dart';
import 'package:learn_flutter/widgets/image_quote_btns.dart';
import 'package:learn_flutter/widgets/image_quote_pic.dart';
import 'package:learn_flutter/widgets/image_quote_title.dart';

class ImageQuoteListView extends StatelessWidget {
  final data;
  final bool hasNext;
  final controller;
  final String screenName;
  final Function callbackMethod;
  const ImageQuoteListView(
      {Key? key,
      required this.data,
      required this.hasNext,
      required this.controller,
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImageQuoteTitle(data: data, index: index),
                ImageQuotePic(
                  image: data[index].image,
                ),
                ImageQuoteBtns(
                    data: data[index],
                    fn: ImageFireStoreDB.incrementLikes,
                    qctx: context,
                    screenName: screenName,
                    callbackMethod: callbackMethod)
              ],
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

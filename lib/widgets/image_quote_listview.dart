import 'package:flutter/material.dart';
import 'package:learn_flutter/core/image_db.dart';
import 'package:learn_flutter/widgets/image_quote_btns.dart';
import 'package:learn_flutter/widgets/image_quote_pic.dart';

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
            return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 300,
                  // maxWidth: MediaQuery.of(context).size.width - 10,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width - 5,
                  margin: EdgeInsets.fromLTRB(1, 0, 1, 10),
                  padding: EdgeInsets.only(bottom: 0),
                  // decoration: BoxDecoration(
                  //   boxShadow: kElevationToShadow[4],
                  //   color: Theme.of(context).bottomAppBarColor,
                  // ),
                  child: Card(
                    elevation: 5,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ImageQuotePic(
                          image: data[index].image,
                        ),
                        ImageQuoteBtns(
                            data: data[index],
                            fn: ImageFireStoreDB.incrementLikes,
                            qctx: context,
                            screenName: screenName,
                            callbackMethod: callbackMethod),
                      ],
                    ),
                  ),
                ));

            // return Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     // ImageQuoteTitle(data: data, index: index),
            //     ImageQuotePic(
            //       image: data[index].image,
            //     ),
            //     ImageQuoteBtns(
            //         data: data[index],
            //         fn: ImageFireStoreDB.incrementLikes,
            //         qctx: context,
            //         screenName: screenName,
            //         callbackMethod: callbackMethod),
            //     // SizedBox(
            //     //   height: 15,
            //     //   child: const DecoratedBox(
            //     //     decoration: BoxDecoration(
            //     //         color: Color.fromARGB(255, 206, 206, 206)),
            //     //   ),
            //     // )
            //   ],
            // );
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

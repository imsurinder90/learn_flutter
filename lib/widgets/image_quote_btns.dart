import 'package:flutter/material.dart';
import 'package:learn_flutter/models/image_quotes.dart';
import 'package:learn_flutter/utils/image/image_utils.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';
import 'package:learn_flutter/utils/utilities.dart';

class ImageQuoteBtns extends StatefulWidget {
  dynamic data;
  Function fn;
  BuildContext qctx;
  String screenName;
  Function callbackMethod;
  ImageQuoteBtns(
      {Key? key,
      required this.data,
      required this.fn,
      required this.qctx,
      required this.screenName,
      required this.callbackMethod})
      : super(key: key);

  @override
  State<ImageQuoteBtns> createState() => _ImageQuoteBtnsState();
}

class _ImageQuoteBtnsState extends State<ImageQuoteBtns> {
  bool isPressed = false;
  bool isBookmarkPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 0, 4, 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(isPressed ? Icons.favorite : Icons.favorite_border),
                color: isPressed ? Colors.red : Colors.black,
                onPressed: () async {
                  if (!isPressed) {
                    setState(() {
                      isPressed = true;
                    });
                    await widget.fn(
                        widget.qctx, widget.data.id, widget.data.likes);
                  }
                },
              ),
              SizedBox(
                width: 16.0,
              ),
              IconButton(
                icon: Icon(Icons.download_outlined),
                color: Colors.black,
                onPressed: () {
                  ImageUtils.downloadFile(widget.data.image, context);
                },
              ),
              SizedBox(
                width: 16.0,
              ),
              IconButton(
                icon: Icon(Icons.share_outlined),
                color: Colors.black,
                onPressed: () async {
                  // Gives error msg, accessing local hidden methods
                  ImageUtils.shareImage(widget.data.image);
                  // await UserSharedPrefernces.saveTextQuote(item);
                },
              ),
              SizedBox(
                width: 16.0,
              ),
              (widget.screenName == "image")
                  ? IconButton(
                      icon: Icon(!isBookmarkPressed
                          ? Icons.bookmark_border_outlined
                          : Icons.bookmark_added),
                      color: Colors.black,
                      onPressed: () {
                        // Gives error msg, accessing local hidden methods
                        if (!isBookmarkPressed) {
                          String newData =
                              ImgQuote.toSerializedData(widget.data);
                          UserSharedPrefernces.saveImgQuote(newData);
                          setState(() {
                            isBookmarkPressed = true;
                          });
                          Utilities.mSnackBar(
                              context, "Picture is bookmarked!");
                        }
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.bookmark_remove),
                      color: Colors.black,
                      onPressed: () async {
                        // Gives error msg, accessing local hidden methods
                        String newData = ImgQuote.toSerializedData(widget.data);
                        await UserSharedPrefernces.removeImgQuote(newData);
                        widget.callbackMethod();
                      },
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

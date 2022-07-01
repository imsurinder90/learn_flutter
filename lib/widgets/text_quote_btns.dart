import 'package:flutter/material.dart';
import 'package:learn_flutter/models/text_quote_model.dart';
import 'package:learn_flutter/utils/image/image_utils.dart';
import 'package:learn_flutter/utils/text/text_utils.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';
import 'package:learn_flutter/utils/utilities.dart';

class TextQuoteBtns extends StatefulWidget {
  final TextQuote item;
  final itemKey;
  final String screenName;
  Function callbackMethod;

  TextQuoteBtns(
      {Key? key,
      required this.itemKey,
      required this.item,
      required this.screenName,
      required this.callbackMethod})
      : super(key: key);

  @override
  State<TextQuoteBtns> createState() => _TextQuoteBtnsState();
}

class _TextQuoteBtnsState extends State<TextQuoteBtns> {
  bool isPressed = false;
  bool isBookmarkPressed = false;
  bool isDisabledLove = false;
  static String quoteIsBookmarkedMsg = "Quote is bookmarked!";
  static String quoteIsLiked = "Quote is liked";

  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    var key = widget.itemKey;
    var screenName = widget.screenName;
    isDisabledLove = (screenName == "quote_details") ? true : false;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.zero,
      height: 43,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              offset: Offset(0.0, 8),
              blurRadius: 7,
              spreadRadius: -1.5,
              color: Color(0x33000000)),
        ],
        color: Theme.of(context).bottomAppBarColor,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (isDisabledLove)
                    ? IconButton(
                        icon: Icon(Icons.favorite),
                        color: Colors.grey,
                        onPressed: () {},
                      )
                    : IconButton(
                        icon: Icon(
                            isPressed ? Icons.favorite : Icons.favorite_border),
                        color: isPressed
                            ? Colors.red
                            : Theme.of(context).iconTheme.color,
                        onPressed: () async {
                          if (!isPressed) {
                            setState(() {
                              isPressed = true;
                            });
                            // await UserSharedPrefernces.saveTextQuote(item);
                            Utilities.mSnackBar(context, quoteIsLiked);
                          }
                        },
                      ),
                SizedBox(
                  width: 16.0,
                ),
                IconButton(
                  icon: Icon(Icons.download_outlined),
                  color: Theme.of(context).iconTheme.color,
                  onPressed: () async {
                    TextUtils.takeScreenShot(context, key, false);
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                IconButton(
                  icon: Icon(Icons.share_outlined),
                  color: Theme.of(context).iconTheme.color,
                  onPressed: () async {
                    TextUtils.takeScreenShot(context, key, true);
                  },
                ),
                SizedBox(
                  width: 16.0,
                ),
                (widget.screenName == "text")
                    ? IconButton(
                        icon: Icon(!isBookmarkPressed
                            ? Icons.bookmark_border_outlined
                            : Icons.bookmark_added),
                        color: Theme.of(context).iconTheme.color,
                        onPressed: () {
                          // Gives error msg, accessing local hidden methods
                          if (!isBookmarkPressed) {
                            String newData =
                                TextQuote.toSerializedData(widget.item);
                            UserSharedPrefernces.saveTextQuote(newData);
                            setState(() {
                              isBookmarkPressed = true;
                            });
                            Utilities.mSnackBar(context, quoteIsBookmarkedMsg);
                          }
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.bookmark_remove),
                        color: (!isDisabledLove)
                            ? Theme.of(context).iconTheme.color
                            : Colors.grey,
                        onPressed: () {
                          // Gives error msg, accessing local hidden methods
                          if (!isDisabledLove) {
                            String newData =
                                TextQuote.toSerializedData(widget.item);
                            UserSharedPrefernces.removeTextQuote(newData);
                            widget.callbackMethod();
                          }
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

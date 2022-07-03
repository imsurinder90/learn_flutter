import 'package:flutter/material.dart';
import 'package:learn_flutter/models/fav_img_model.dart';
import 'package:learn_flutter/models/image_quotes.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';
import 'package:learn_flutter/widgets/image_quote_listview.dart';
import 'package:learn_flutter/widgets/image_quote_btns.dart';
import 'package:provider/provider.dart';

class FavImagePage extends StatefulWidget {
  FavImagePage({Key? key}) : super(key: key);

  @override
  State<FavImagePage> createState() => _FavImagePageState();
}

class _FavImagePageState extends State<FavImagePage> {
  final controller = ScrollController();
  bool hasNext = false;
  List<ImgQuote> data = [];
  static String noPicQuotesStr = "No Picture quoutes.";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavImgModel>(builder: (context, modelObj, _) {
      var data = modelObj.items;
      if (data.isNotEmpty) {
        return ImageQuoteListView(
          data: data,
          hasNext: hasNext,
          controller: controller,
          screenName: "fav",
        );
      } else {
        return Center(
          child: Text(noPicQuotesStr),
        );
      }
    });
  }
}

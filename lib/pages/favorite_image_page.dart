import 'package:flutter/material.dart';
import 'package:learn_flutter/models/image_quotes.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';
import 'package:learn_flutter/widgets/image_quote_listview.dart';

class FavImagePage extends StatefulWidget {
  FavImagePage({Key? key}) : super(key: key);

  @override
  State<FavImagePage> createState() => _FavImagePageState();
}

class _FavImagePageState extends State<FavImagePage> {
  final controller = ScrollController();
  bool hasNext = false;
  List<ImgQuote> data = [];

  @override
  void initState() {
    super.initState();
    getImgData();
  }

  List<ImgQuote> getImgData() {
    List<String> myData = UserSharedPrefernces.getImgQuote();
    setState(() {
      data = myData.map((el) => ImgQuote.toDeserializeData(el)).toList();
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      return ImageQuoteListView(
        data: data,
        hasNext: hasNext,
        controller: controller,
        screenName: "fav",
        callbackMethod: getImgData,
      );
    } else {
      return Center(
        child: Text("No Picture quoutes."),
      );
    }
  }
}

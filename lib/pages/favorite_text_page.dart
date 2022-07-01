import 'package:flutter/material.dart';
import 'package:learn_flutter/models/text_quote_model.dart';
import 'package:learn_flutter/utils/user_shared_pref.dart';
import 'package:learn_flutter/widgets/text_quote_listview.dart';

class FavTextPage extends StatefulWidget {
  FavTextPage({Key? key}) : super(key: key);

  @override
  State<FavTextPage> createState() => _FavTextPageState();
}

class _FavTextPageState extends State<FavTextPage> {
  final controller = ScrollController();

  bool hasNext = false;
  static String noTextQuotesStr = "No quotes found.";

  List<TextQuote> data = [];
  List<GlobalKey> renderKeys = [];

  @override
  void initState() {
    super.initState();
    getTextData();
  }

  List<TextQuote> getTextData() {
    List<String> myData = UserSharedPrefernces.getTextQuote();

    renderKeys = List<GlobalKey<FormState>>.generate(
        myData.length, (i) => GlobalKey<FormState>(debugLabel: ' _formKey'));

    setState(() {
      data = myData.map((el) => TextQuote.toDeserializeData(el)).toList();
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      return TextQuoteListView(
        data: data,
        hasNext: hasNext,
        controller: controller,
        renderKeys: renderKeys,
        screenName: "fav",
        callbackMethod: getTextData,
      );
    } else {
      return Center(
        child: Text(noTextQuotesStr),
      );
    }
  }
}

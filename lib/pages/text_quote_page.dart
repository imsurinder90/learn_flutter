// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter/models/categories.dart';
import 'package:learn_flutter/theme/themes.dart';
import 'package:learn_flutter/widgets/category_scrollbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_flutter/widgets/quotes_app_title.dart';
import 'package:learn_flutter/widgets/text_quote_refresh.dart';

class TextQuote extends StatefulWidget {
  const TextQuote({Key? key}) : super(key: key);

  @override
  State<TextQuote> createState() => _TextQuoteState();
}

class _TextQuoteState extends State<TextQuote> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        QuotesAppTitle(),
        CategoryScrollBar(
          cats: TextCategoryModel.cats,
          which: "text",
        ),
        TextQuoteRefresh(),
      ]),
    );
  }
}

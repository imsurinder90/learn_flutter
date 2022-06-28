// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:learn_flutter/models/categories.dart';
import 'package:learn_flutter/widgets/category_scrollbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 10, left: 10, bottom: 0),
          child: Text("Best Motivation Quotes",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      CategoryScrollBar(
        cats: TextCategoryModel.cats,
        which: "text",
      ),
      TextQuoteRefresh(),
    ]);
  }
}

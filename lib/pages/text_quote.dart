// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter/models/categories.dart';
import 'package:learn_flutter/models/image_quotes.dart';
import 'package:learn_flutter/widgets/bottom_menubar.dart';
import 'package:learn_flutter/widgets/category_scrollbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_flutter/widgets/text_quote_listview.dart';
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

  loadQuotes() async {
    final catalogJson = await rootBundle.loadString("assets/files/quotes.json");
    final decodedData = jsonDecode(catalogJson);
    var quotesData = decodedData["quotes"];

    ImgQuoteModel.items = List.from(quotesData)
        .map<ImgQuote>((item) => ImgQuote.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
      ])),
      bottomNavigationBar: BottonNavigationWidget(),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_flutter/models/categories.dart';
import 'package:learn_flutter/models/image_quotes.dart';
import 'package:learn_flutter/widgets/bottom_menubar.dart';
import 'package:learn_flutter/widgets/category_scrollbar.dart';
import 'package:learn_flutter/widgets/image_quote_refresh.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageQuotePage extends StatefulWidget {
  const ImageQuotePage({Key? key}) : super(key: key);

  @override
  State<ImageQuotePage> createState() => _ImageQuotePageState();
}

class _ImageQuotePageState extends State<ImageQuotePage> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) {
    //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //       systemNavigationBarColor: Colors.transparent,
    //       systemNavigationBarIconBrightness: Brightness.dark));
    // }
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
        cats: ImageCategoryModel.cats,
        which: "image",
      ),
      ImageQuoteRefresh()
    ]);
  }
}

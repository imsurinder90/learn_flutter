// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:learn_flutter/models/categories.dart';
import 'package:learn_flutter/widgets/category_scrollbar.dart';
import 'package:learn_flutter/widgets/image_quote_refresh.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_flutter/widgets/quotes_app_title.dart';

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
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        QuotesAppTitle(),
        CategoryScrollBar(
          cats: ImageCategoryModel.cats,
          which: "image",
        ),
        ImageQuoteRefresh()
      ]),
    );
  }
}

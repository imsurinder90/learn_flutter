// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/models/image_quotes.dart';
import 'package:learn_flutter/widgets/image_quote_listview.dart';

class ImageQuoteRefresh extends StatefulWidget {
  static ValueNotifier<String> category = ValueNotifier("");
  const ImageQuoteRefresh({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageQuoteRefreshState createState() => _ImageQuoteRefreshState();
}

class _ImageQuoteRefreshState extends State<ImageQuoteRefresh> {
  final controller = ScrollController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late Future<List<ImgQuote>> imgQuotesList;
  ValueNotifier<String> mycategory = ImageQuoteRefresh.category;
  late QueryDocumentSnapshot<Map<String, dynamic>> lastSnap;
  int docLimit = 6;
  bool hasNext = true;
  bool isLoading = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(scrollListener);
    mycategory.addListener(catListener);

    if (!isLoading) {
      isLoading = true;
      imgQuotesList = _initRetrieval();
      isLoading = false;
      mycategory.value = "";
    }
  }

  @override
  void dispose() {
    controller.removeListener(scrollListener);
    controller.dispose();
    super.dispose();
  }

  void scrollListener() async {
    if (controller.position.maxScrollExtent == controller.offset &&
        !controller.position.outOfRange &&
        hasNext) {
      List<ImgQuote> posts = await _initRetrieval();
      final list = await imgQuotesList;

      setState(() {
        list.addAll(posts);
      });
    }
  }

  void reload() {
    if (!isLoading) {
      isLoading = true;
      setState(() {
        imgQuotesList = _initRetrieval();
        isLoading = false;
        hasNext = true;
      });
    }
  }

  void catListener() {
    if (mycategory.value != "") {
      reload();
    }
  }

  Future<List<ImgQuote>> _initRetrieval() async {
    return (mycategory.value.isNotEmpty) ? getImgQuotesByCat() : getImgQuotes();
  }

  Future<List<ImgQuote>> getImgQuotes() async {
    QuerySnapshot<Map<String, dynamic>> snapshot;
    final List<ImgQuote> mdocs;

    CollectionReference ref = _db.collection("imagequotes");
    snapshot = isLoading
        ? await ref.limit(docLimit).get() as QuerySnapshot<Map<String, dynamic>>
        : await ref.startAfterDocument(lastSnap).limit(docLimit).get()
            as QuerySnapshot<Map<String, dynamic>>;
    mdocs = (snapshot.docs.isNotEmpty)
        ? snapshot.docs
            .map((docSnapshot) => ImgQuote.fromDocumentSnapshot(docSnapshot))
            .toList()
        : [ImgQuote.fromDocumentSnapshot(lastSnap)];

    print("firestore");
    if (snapshot.docs.isEmpty) {
      hasNext = false;
    } else {
      lastSnap = snapshot.docs.last;
      if (mdocs.length < docLimit) hasNext = false;
    }

    return mdocs;
  }

  Future<List<ImgQuote>> getImgQuotesByCat() async {
    QuerySnapshot<Map<String, dynamic>> snapshot;
    final List<ImgQuote> mdocs;
    String imgCat = mycategory.value.toLowerCase();

    CollectionReference ref = _db.collection("imagequotes");
    snapshot = isLoading
        ? await ref.where('category', isEqualTo: imgCat).limit(docLimit).get()
            as QuerySnapshot<Map<String, dynamic>>
        : await ref
            .where('category', isEqualTo: imgCat)
            .startAfterDocument(lastSnap)
            .limit(docLimit)
            .get() as QuerySnapshot<Map<String, dynamic>>;

    mdocs = snapshot.docs
        .map((docSnapshot) => ImgQuote.fromDocumentSnapshot(docSnapshot))
        .toList();

    print("cat: firestore");
    if (snapshot.docs.isEmpty) {
      hasNext = false;
    } else {
      lastSnap = snapshot.docs.last;
      if (mdocs.length < docLimit) hasNext = false;
    }

    return mdocs;
  }

  Future _refresh() async {
    print('Refreshing image qutoes...');
    final qlist = await imgQuotesList;
    setState(() {
      qlist.clear();
      isLoading = false;
      hasNext = false;
    });
    await Future.delayed(Duration(seconds: 1));

    reload();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder(
          future: imgQuotesList,
          builder:
              (BuildContext context, AsyncSnapshot<List<ImgQuote>?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: Text("Fetch Something"));
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: Text("Please wait while fetching"));
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text("Some error occured."));
                }
                var data = snapshot.data!;
                if (data.isEmpty) {
                  return Center(child: Text("No picture quotes found"));
                }
                return ImageQuoteListView(
                  data: data,
                  hasNext: hasNext,
                  controller: controller,
                  screenName: "image",
                  callbackMethod: reload,
                );
            }
          },
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/models/text_quote_model.dart';
import 'package:learn_flutter/widgets/text_quote_listview.dart';

class TextQuoteRefresh extends StatefulWidget {
  static ValueNotifier<String> category = ValueNotifier("");
  const TextQuoteRefresh({Key? key}) : super(key: key);

  @override
  State<TextQuoteRefresh> createState() => _TextQuoteRefreshState();
}

class _TextQuoteRefreshState extends State<TextQuoteRefresh> {
  final controller = ScrollController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late Future<List<TextQuote>> textQuotesList;
  ValueNotifier<String> mycategory = TextQuoteRefresh.category;
  late QueryDocumentSnapshot<Map<String, dynamic>> lastSnap;
  int docLimit = 6;
  bool hasNext = true;
  bool isLoading = false;
  List<GlobalKey> renderKeys = [];
  static String textQuotes = "textquotes";

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    renderKeys = List<GlobalKey<FormState>>.generate(
        docLimit, (i) => GlobalKey<FormState>(debugLabel: ' _formKey'));
    controller.addListener(scrollListener);
    mycategory.addListener(catListener);
    initiate();
  }

  @override
  void dispose() {
    controller.removeListener(scrollListener);
    controller.dispose();
    super.dispose();
  }

  void initiate() async {
    if (!isLoading) {
      isLoading = true;
      textQuotesList = _initRetrieval();
      isLoading = false;
      mycategory.value = "";
    }
  }

  void scrollListener() async {
    if (controller.position.maxScrollExtent == controller.offset &&
        !controller.position.outOfRange &&
        hasNext) {
      List<TextQuote> posts = await _initRetrieval();
      final list = await textQuotesList;

      int total = posts.length + list.length;
      renderKeys = List<GlobalKey<FormState>>.generate(
          total, (i) => GlobalKey<FormState>(debugLabel: ' _formKey'));

      setState(() {
        list.addAll(posts);
      });
    }
  }

  void reload() {
    renderKeys = List<GlobalKey<FormState>>.generate(
        docLimit, (i) => GlobalKey<FormState>(debugLabel: ' _formKey'));
    if (!isLoading) {
      isLoading = true;
      setState(() {
        textQuotesList = _initRetrieval();
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

  Future<List<TextQuote>> _initRetrieval() async {
    return (mycategory.value.isNotEmpty)
        ? getTextQuotesByCat()
        : getTextQuotes();
  }

  Future<List<TextQuote>> getTextQuotes() async {
    QuerySnapshot<Map<String, dynamic>> snapshot;
    final List<TextQuote> mdocs;

    CollectionReference ref = _db.collection(textQuotes);
    var key = ref.doc().id;
    snapshot = isLoading
        ? await ref
            .where(FieldPath.documentId, isGreaterThanOrEqualTo: key)
            .limit(docLimit)
            .get() as QuerySnapshot<Map<String, dynamic>>
        : await ref.startAfterDocument(lastSnap).limit(docLimit).get()
            as QuerySnapshot<Map<String, dynamic>>;
    mdocs = (snapshot.docs.isNotEmpty)
        ? snapshot.docs
            .map((docSnapshot) => TextQuote.fromDocumentSnapshot(docSnapshot))
            .toList()
        : [TextQuote.fromDocumentSnapshot(lastSnap)];

    print("firestore");
    if (snapshot.docs.isEmpty) {
      hasNext = false;
    } else {
      lastSnap = snapshot.docs.last;
      if (mdocs.length < docLimit) hasNext = false;
    }

    return mdocs;
  }

  Future<List<TextQuote>> getTextQuotesByCat() async {
    QuerySnapshot<Map<String, dynamic>> snapshot;
    final List<TextQuote> mdocs;
    String textCat = mycategory.value.toLowerCase();

    CollectionReference ref = _db.collection(textQuotes);
    var key = ref.doc().id;
    snapshot = isLoading
        ? await ref
            .where('category', isEqualTo: textCat)
            .where(FieldPath.documentId, isGreaterThanOrEqualTo: key)
            .limit(docLimit)
            .get() as QuerySnapshot<Map<String, dynamic>>
        : await ref
            .where('category', isEqualTo: textCat)
            .startAfterDocument(lastSnap)
            .limit(docLimit)
            .get() as QuerySnapshot<Map<String, dynamic>>;

    mdocs = snapshot.docs
        .map((docSnapshot) => TextQuote.fromDocumentSnapshot(docSnapshot))
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
    final qlist = await textQuotesList;
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
          future: textQuotesList,
          builder:
              (BuildContext context, AsyncSnapshot<List<TextQuote>?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(child: Text("Fetch Something"));
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.waiting:
                return Center(child: Text("Please wait while fetching"));
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text("Some error occured."));
                }
                var data = snapshot.data!;
                if (data.isEmpty) {
                  return Center(child: Text("No quotes found"));
                }
                return TextQuoteListView(
                    data: data,
                    hasNext: hasNext,
                    controller: controller,
                    renderKeys: renderKeys,
                    screenName: "text",
                    callbackMethod: reload);
            }
          },
        ),
      ),
    );
  }
}

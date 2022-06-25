import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_flutter/utils/utilities.dart';

class ImageFireStoreDB {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static incrementLikes(context, String docID, int likes) async {
    await _db.collection("imagequotes").doc(docID).update({"likes": likes + 1});
    Utilities.mSnackBar(context, "Quote is liked by you!");
  }
}

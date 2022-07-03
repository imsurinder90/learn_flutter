import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:learn_flutter/models/image_quotes.dart';

class FavImgModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<ImgQuote> _items = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<ImgQuote> get items => UnmodifiableListView(_items);

  set items(List<ImgQuote> data) {
    _items.addAll(data);
    notifyListeners();
  }

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length;

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(ImgQuote item) {
    _items.insert(0, item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove(ImgQuote item) {
    _items.remove(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}

// class Item {
//   String name;
//   Item({required this.name});
// }

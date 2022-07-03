import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:learn_flutter/models/fav_img_model.dart';
import 'package:learn_flutter/pages/mycart.dart';
import 'package:provider/provider.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Catalog page"),
      ),
      body: Container(
        child: Column(children: [
          ListTile(
            title: Text("product 1"),
          ),
          ElevatedButton(
              onPressed: () {
                // Provider.of<CartModel>(context, listen: false)
                //     .add(Item(name: 'Dash'));
                // Navigator.push(
                //   context,
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) => const MyCart(),
                //   ),
                // );
              },
              child: Text("add item to cart")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyCart(),
                  ),
                );
              },
              child: Text("Go to Cart Page"))
        ]),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:learn_flutter/models/fav_img_model.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    print("rebuilt");
    return Text("hi");
    // return Consumer<CartModel>(builder: (context, cart, child) {
    //   return Text('Total price: ${cart.totalPrice}');
    // var data = cart.items;
    // print(data);
    // return ListView.builder(
    //   itemCount: cart.items.length,
    //   itemBuilder: (context, index) => Card(
    //     child: ListTile(
    //       title: Text(data[index].name),
    //     ),
    //   ),
    // );
    // });
    // return Scaffold(
    //     appBar: AppBar(title: Text("My Cart Page")),
    //     body: SafeArea(
    //       child: Consumer<CartModel>(builder: (context, cart, child) {
    //         return Text('Total price: ${cart.totalPrice}');
    //         // var data = cart.items;
    //         // print(data);
    //         // return ListView.builder(
    //         //   itemCount: cart.items.length,
    //         //   itemBuilder: (context, index) => Card(
    //         //     child: ListTile(
    //         //       title: Text(data[index].name),
    //         //     ),
    //         //   ),
    //         // );
    //       }),
    //     ));
  }
}

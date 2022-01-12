import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  var Product;
  CartPage({this.Product});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  get Product => null;

  //get data => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Add To Cart"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))),
        body: Column(children: [
          Text(Product["title"]),
        ]));
  }
}

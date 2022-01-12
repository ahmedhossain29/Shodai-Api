import 'package:flutter/material.dart';
import 'package:shodaimama/CartPage.dart';
import 'package:shodaimama/HomePage.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  var _CurrentIndex = 0;
  final Pages = [
    HomePage(),
    //CartPage(),
  ];
  List Product = [];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), label: "Cart"),
        ],
        onTap: (index) {
          setState(() {
            _CurrentIndex = index;
          });
        },
      ),
      body: Pages[_CurrentIndex],
    );
  }
}

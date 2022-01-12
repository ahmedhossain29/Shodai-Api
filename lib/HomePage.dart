import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shodaimama/AppColor.dart';
import 'package:shodaimama/CartPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  var Product;
  Future getData() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    setState(() {
      var decodedData = json.decode(response.body);
      data = decodedData;
      print(data);
    });
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: AppColor.MyColor,
          title: Text("Home"),
          actions: [
            Icon(
              Icons.search,
              size: 35,
            ),
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.add_shopping_cart,
                size: 30,
              ),
            )
          ],
        ),
        body: new Container(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                          image: AssetImage("image/Capture.JPG"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //2nd Image of Slider
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                          image: AssetImage("image/Capture1.JPG"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                          image: AssetImage("image/Capture3.JPG"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //4th Image of Slider
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                          image: AssetImage("image/Capture4.JPG"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //5th Image of Slider
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        image: DecorationImage(
                          image: AssetImage("image/Capture5.JPG"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 170,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
                Container(
                  color: AppColor.MyColor,
                  height: 38,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Adabor",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      SizedBox(
                        width: 170,
                      ),
                      Icon(
                        Icons.add_location,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 180, top: 10),
                  child: Text(
                    "ShodaiMama Offers",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 180,
                    top: 10,
                  ),
                  child: Container(
                    height: 190,
                    width: 180,
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage("image/cap6.JPG"),
                          // height: 150,
                          // width: 140,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "সদাইমামা বার-বি-কিউ ফেস্ট",
                            style: TextStyle(
                                color: AppColor.MyColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Icon(
                        //   Icons.arrow_forward_ios,
                        //   size: 15,
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: 8,
                          height: 70,
                          decoration: ShapeDecoration(
                              color: Color(0xff61A464),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              )),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Fresh",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "গুনগত মান বজায় রা্খার জন্য পচনশীল খাদ্যপন্য\nসরবরাহ করা হয় সকাল ৮-১১ টা পর্যন্ত ।",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                new Container(
                  child: new GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: data == null ? 0 : data.length,
                    controller: new ScrollController(keepScrollOffset: true),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return new GridTile(
                        header: new Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.centerRight,
                            child: new Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)),
                              height: 25,
                              width: 115,
                              child: Center(
                                child: Text(
                                  data[index]["category"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                        child: Card(
                          child: Container(
                            width: 160,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Image(
                                  image: NetworkImage(data[index]["image"]),
                                  height: 70,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        data[index]["title"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "\$ ${data[index]["price"].toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 167,
                                    color: AppColor.MyColor,
                                    height: 33,
                                    child: Center(
                                        child: Text(
                                      "Add To Cart",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 230),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: [
                              Text('Show More'),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 13,
                              )
                            ],
                          )),
                    )
                  ],
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 65, top: 20),
                        child: Row(
                          children: [
                            Image.asset(
                              "image/cap6.JPG",
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "সদাইমামা বার-বি-কিউ ফেস্ট",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff006A4F),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 105),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                                color: Color(0xff006A4F),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 230),
                      child: Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: [
                              Text('Show More'),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 13,
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

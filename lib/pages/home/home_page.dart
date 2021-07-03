import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:moderna/constants.dart';

import 'package:moderna/models/product_model.dart';
import 'package:moderna/pages/home/product_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home_page";

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) Navigator.pushNamed(context, "/shop_page");
    if (index == 2) Navigator.pushNamed(context, "/ar_page");
    if (index == 3) Navigator.pushNamed(context, "/cart_page");
    if (index == 4) Navigator.pushNamed(context, "/favorite_page");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bottom1.png",
                  height: height * 0.04,
                ),
                title: Text("Нүүр"),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bottom2.png",
                  height: height * 0.04,
                ),
                title: Text("Дэлгүүр"),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bottom3.png",
                  height: height * 0.04,
                ),
                title: Text("AR"),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bottom4.png",
                  height: height * 0.04,
                ),
                title: Text("Сагс"),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bottom5.png",
                  height: height * 0.04,
                ),
                title: Text("Хүслийн"),
              ),
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
          ),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  int count = 1;
  bool isCheck = false;
  bool _isCartCheck = false;
  bool showDescription = true;
  String checkCalls;
  List<ProductModel> favList = [];
  List<ProductModel> cartList = [];
  List<ProductModel> favList2 = [];
  var _user;
  int currentFilterIndex = 0;
  final _searchTEC = new TextEditingController();

  checkFilter2(String id) {
    if (id != null) {
      if (id.split(",").contains("lol")) {
        return true;
      }
    }
  }

  checkIsCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prebString = "cart";
    // prefs.clear();

    prebString += _user["user"]["id"].toString();
    String checkCart = (prefs.getString(prebString) ?? "null");

    if (checkCart != "null") {
      cartList = (json.decode(checkCart) as List)
          .map((call) => ProductModel.fromJson(call))
          .toList();
    }

    for (int i = 0; i < Data.productItems.length; i++) {
      var existingCart = cartList.firstWhere(
          (favCall) => favCall.id == Data.productItems[i].id,
          orElse: () => null);

      if (existingCart != null) {
        Data.productItems[i].isCart = true;
      } else {
        Data.productItems[i].isCart = false;
      }
    }

    setState(() {
      _isCartCheck = true;
    });
  }

  @override
  void initState() {
    if (Data.user != null) _user = json.decode(Data.user);
    checkIsCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _topBar(height, width),
            if (Data.bannerItems.isNotEmpty) _banner(height, width),
            if (_isCartCheck) _bodyContainer(height, width),
            if (!_isCartCheck)
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.5),
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                    strokeWidth: 2.0,
                  ),
                ),
              ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Padding(
            //     padding: EdgeInsets.only(top: height * 0.3),
            //     child: Wrap(
            //       children: List.generate(
            //         10,
            //         (index) => _item(height, width, index),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _bodyContainer(double height, double width) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.3),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              children: List.generate(
                Data.categoryItems.length,
                (index) {
                  return Column(
                    children: [
                      // if (index != 2)
                      _item(height, width, index),
                      if (index == 2) _categoriesItem(height, width, index),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoriesItem(double height, double width, int index) => Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.04,
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.06,
                    bottom: height * 0.01,
                  ),
                  child: Text(
                    "Ангилал",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.056,
              bottom: MediaQuery.of(context).size.height * 0.01,
              right: width * 0.02,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.14,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Data.categoryItems.length,
                  itemBuilder: (context, index2) => Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.04,
                      top: height * 0.01,
                      bottom: height * 0.01,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.2),
                          //     spreadRadius: 2,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 3),
                          //   ),
                          // ],

                          ),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.14,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(
                                12.0,
                              ),
                              color: Color(0xFF393938).withOpacity(0.1),
                            ),
                            child: Row(
                              children: [
                                Text(""),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: Data.categoryItems[index2].image
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: width * 0.04,
                                      ),
                                      child: Container(
                                        width: width * 0.28,
                                        child: Text(
                                          Data.categoryItems[index2].name,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: height * 0.02,
                                            color: Colors.grey.withOpacity(
                                              0.8,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/product_detail");
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  child: Text(""),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.044,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01,
                      right: width * 0.07,
                    ),
                    child: Text(
                      "Бүгд",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _item(double height, double width, int index) => Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.04,
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.06,
                    bottom: height * 0.01,
                  ),
                  child: Text(
                    Data.categoryItems[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).size.height * 0.022,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.056,
              bottom: MediaQuery.of(context).size.height * 0.01,
              left: width * 0.02,
              right: width * 0.02,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Data.productItems.length,
                  itemBuilder: (context, index2) => Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.04,
                      top: height * 0.01,
                      bottom: height * 0.01,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.2),
                          //     spreadRadius: 2,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 3),
                          //   ),
                          // ],

                          ),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.black.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(
                                12.0,
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Text(""),
                                Expanded(
                                  flex: 2,
                                  child: CachedNetworkImage(
                                    imageUrl: Data.productItems[index2].filePath
                                        .toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: width * 0.04,
                                          ),
                                          child: Container(
                                            width: width * 0.3,
                                            child: Text(
                                              Data.productItems[index2].title
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: height * 0.02,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: width * 0.04,
                                          ),
                                          child: Container(
                                            width: width * 0.3,
                                            child: Text(
                                              Data.productItems[index2].subtitle
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: height * 0.017,
                                                color: Colors.grey.withOpacity(
                                                  0.8,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: width * 0.04,
                                          right: width * 0.03,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (Data.productItems[index2]
                                                    .price !=
                                                null)
                                              Text(
                                                Data.productItems[index2].price
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: height * 0.018,
                                                ),
                                              ),
                                            if (Data.productItems[index2]
                                                    .price ==
                                                null)
                                              Text(""),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetail(
                                        index: index2,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.42,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Text(""),
                                ),
                              ),
                            ),
                          ),
                          if (Data.productItems[index2].isCart)
                            Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: height * 0.02,
                                    right: width * 0.04,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      14.0,
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          saveProductCart(index2);
                                        },
                                        child: Container(
                                          height: height * 0.048,
                                          width: height * 0.048,
                                          child: Material(
                                            color: Colors.grey[600],
                                            child: Center(
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (!Data.productItems[index2].isCart)
                            Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: height * 0.02,
                                    right: width * 0.04,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      14.0,
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Data.productItems[index2].isCart =
                                              true;
                                          saveProductCart(index2);
                                        },
                                        child: Container(
                                          height: height * 0.048,
                                          width: height * 0.048,
                                          child: Material(
                                            color: Colors.grey[600],
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.044,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01,
                      right: width * 0.07,
                    ),
                    child: Text(
                      "Бүгд",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _banner(double height, double width) => Padding(
        padding: EdgeInsets.only(top: height * 0.19),
        child: Container(
          width: width,
          height: height * 0.1,
          child: Swiper(
            autoplay: Data.bannerItems.length > 1,
            scale: 0.9,
            itemCount: Data.bannerItems.length,
            viewportFraction: 0.8,
            itemBuilder: (context, index) => Container(
              height: height * 0.1,
              width: width,
              child: Image.network(
                Data.bannerItems[index].image.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

  Widget _topBar(double height, double width) => Padding(
        padding: EdgeInsets.only(top: height * 0.07),
        child: Container(
          width: width,
          height: height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "",
              ),
              Container(
                width: width * 0.7,
                child: Image.asset(
                  "assets/white_logo.png",
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: Image.asset("assets/person.png"),
                onPressed: () {
                  Navigator.pushNamed(context, "/profile_page");
                },
                color: Colors.black,
                iconSize: height * 0.05,
              ),
              Text(
                "",
              ),
              Text(
                "",
              ),
            ],
          ),
        ),
      );

  saveProductCart(int index) async {
    final prefs = await SharedPreferences.getInstance();
    String prebString = "cart";
    // prefs.clear();
    prebString += _user["user"]["id"].toString();

    List<ProductModel> favList2 = <ProductModel>[];
    String checkCalls2 = (prefs.getString(prebString) ?? "null");

    if (checkCalls2 != "null")
      favList2 = (json.decode(checkCalls2) as List)
          .map((call) => ProductModel.fromJson(call))
          .toList();

    var existingCall = favList2.firstWhere(
        (favCall) => favCall.id == Data.productItems[index].id,
        orElse: () => null);

    if (existingCall == null) {
      favList2.add(Data.productItems[index]);
      String encodeCalls = json.encode(
        favList2.map<Map<String, dynamic>>((call) => call.toMap(call)).toList(),
      );
      // print(encodeCalls);
      prefs.setString(prebString, encodeCalls);

      setState(() {
        Data.productItems[index].isCart = true;
      });
    } else {
      favList2
          .removeWhere((favCall) => favCall.id == Data.productItems[index].id);

      String encodeCalls = json.encode(
        favList2.map<Map<String, dynamic>>((call) => call.toMap(call)).toList(),
      );
      // print(encodeCalls);
      prefs.setString(prebString, encodeCalls);
      setState(() {
        Data.productItems[index].isCart = false;
      });
    }
  }
}

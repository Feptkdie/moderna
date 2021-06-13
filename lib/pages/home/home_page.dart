import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mod/constants.dart';
import 'package:mod/pages/ar/ar_page.dart';
import 'package:mod/pages/cart/cart_page.dart';
import 'package:mod/pages/shop/shop_page.dart';

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
    double width = MediaQuery.of(context).size.width;
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
  int currentFilterIndex = 0;
  final _searchTEC = new TextEditingController();
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  checkFilter2(String id) {
    if (id != null) {
      if (id.split(",").contains("lol")) {
        return true;
      }
    }
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
            _banner(height, width),
            _bodyContainer(height, width),
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
                4,
                (index) {
                  return Column(
                    children: [
                      if (index != 2) _item(height, width, index),
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
                  itemCount: 3,
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
                                      imageUrl:
                                          "https://admincms.carlhansen.com/globalassets/products/chairs/e005/embrace-chair-eg-saebe-loke7748.png?aspect=16:9&device=desktop&size=medium&display=standard",
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
                                          "Germany",
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
                    "Онцгой санал",
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
                  itemCount: 3,
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
                                    imageUrl:
                                        "https://admincms.carlhansen.com/globalassets/products/chairs/e005/embrace-chair-eg-saebe-loke7748.png?aspect=16:9&device=desktop&size=medium&display=standard",
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
                                              "Vanna Boucle",
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
                                              "Germany",
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
                                            Text(
                                              "500.000₮",
                                              style: TextStyle(
                                                fontSize: height * 0.018,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: height * 0.02,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  14.0,
                                                ),
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
                                  Navigator.pushNamed(
                                      context, "/product_detail");
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
            autoplay: true,
            scale: 0.9,
            itemCount: 3,
            viewportFraction: 0.8,
            itemBuilder: (context, index) => Container(
              height: height * 0.1,
              width: width,
              child: Image.network(
                "http://nicodays.com/banner.png",
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
                onPressed: () {},
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
}

/*
https://webimages.neptune.com/images/2abedbbf-8448-47c5-a71160ee7c17e04c?anchor=center&mode=crop&quality=80&width=1600
https://admincms.carlhansen.com/globalassets/products/chairs/e005/embrace-chair-eg-saebe-loke7748.png?aspect=16:9&device=desktop&size=medium&display=standard
https://www.dan-form.com/media/h2vavjhh/embrace-chair-vintage-grey-art-leather-with-black-metal-legs-100801530-02-front.png?width=1920
*/

/*

  First design
  import 'package:flutter/material.dart';
import 'package:mod/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home_page";

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentFilterIndex = 0;
  final _searchTEC = new TextEditingController();
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  checkFilter2(String id) {
    if (id != null) {
      if (id.split(",").contains("lol")) {
        return true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      backgroundColor: kBackgroundColor,
      endDrawer: _endDrawer(height, width),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _backgroundContainers(height, width),
            _topBar(height, width),
            _search(height, width),
            _filters(height, width),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.3),
                child: Wrap(
                  children: List.generate(
                    10,
                    (index) => _item(height, width, index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filters(double height, double width) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.28, left: width * 0.1),
          child: Container(
            width: width,
            height: height * 0.04,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Column(
                children: [
                  if (index == currentFilterIndex)
                    Padding(
                      padding: EdgeInsets.only(
                        right: 8.0,
                        left: 8.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                currentFilterIndex = index;
                              });
                            },
                            child: Container(
                              height: height * 0.04,
                              color: Colors.white.withOpacity(0.6),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 28.0,
                                  left: 28.0,
                                  top: 8.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  "All",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (index != currentFilterIndex)
                    Padding(
                      padding: EdgeInsets.only(
                        right: 8.0,
                        left: 8.0,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                currentFilterIndex = index;
                              });
                            },
                            child: Container(
                              height: height * 0.04,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 28.0,
                                  left: 28.0,
                                  top: 8.0,
                                  bottom: 8.0,
                                ),
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
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
      );

  Widget _search(double height, double width) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.18),
          child: Container(
            width: width * 0.8,
            height: height * 0.06,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            child: Center(
              child: TextField(
                controller: _searchTEC,
                decoration: InputDecoration(
                  hintText: "хайх..",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  isDense: true,
                  prefixIcon: Icon(Icons.search),
                ),
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
              Text(
                "ModernaAR",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.04,
                ),
              ),
              Text(
                "",
              ),
              Text(
                "",
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications_outlined),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      _key.currentState.openEndDrawer();
                    },
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _item(double height, double width, int index) => Padding(
        padding: EdgeInsets.only(
          top: height * 0.02,
          bottom: height * 0.02,
        ),
        child: Container(
          height: height * 0.21,
          width: width * 0.8,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      18.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      18.0,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: height * 0.18,
                          width: width * 0.8,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.orange[100],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        14.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: width * 0.06,
                                      left: width * 0.06,
                                      top: 6.0,
                                      bottom: 6.0,
                                    ),
                                    child: Text("56 &"),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: width * 0.06,
                                    bottom: height * 0.05,
                                  ),
                                  child: Container(
                                    width: width * 0.3,
                                    child: Text(
                                      "Classic Leather Arm Chair",
                                      style: TextStyle(
                                        fontSize: height * 0.02,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/product_detail",
                                arguments: {'index': index},
                              );
                            },
                            child: Container(
                              height: height * 0.18,
                              width: width * 0.8,
                              color: Colors.transparent,
                              child: Text(""),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: width * 0.04,
                    bottom: height * 0.01,
                  ),
                  child: Container(
                    height: height * 0.6,
                    child: Image.network(
                      "https://admincms.carlhansen.com/globalassets/products/chairs/e005/embrace-chair-eg-saebe-loke7748.png?aspect=16:9&device=desktop&size=medium&display=standard",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _endDrawer(double height, double width) => Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.0,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: kPrimaryColor,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.14,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                            ),
                            Text(
                              "  Нүүр хуудас",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: kPrimaryColor,
                    onTap: () {
                      Navigator.pushNamed(context, "/profile_page");
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.14,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                            ),
                            Text(
                              "  Profile",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: kPrimaryColor,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.14,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_bag,
                            ),
                            Text(
                              "  Shopping cart",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: kPrimaryColor,
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.14,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_add,
                            ),
                            Text(
                              "  Хамтарч ажиллах",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (Data.userToken.isNotEmpty)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: kPrimaryColor,
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width * 0.14,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_add,
                              ),
                              Text(
                                "  Sign out",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: kPrimaryColor,
                    onTap: () {
                      launch(
                        "tel://99115351",
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.14,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.038,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(
                                  8.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                ),
                                child: Center(
                                  child: Text(
                                    "99115352",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.046,
                                      fontWeight: FontWeight.bold,
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
              ],
            ),
          ),
        ),
      );

  Widget _backgroundContainers(double height, double width) => Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: height * 0.5,
              width: width,
              color: kPrimaryColor,
              child: Text(""),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.4),
              child: Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                height: height * 0.2,
                width: width,
                child: Text(""),
              ),
            ),
          ),
        ],
      );
}

/*
https://webimages.neptune.com/images/2abedbbf-8448-47c5-a71160ee7c17e04c?anchor=center&mode=crop&quality=80&width=1600
https://admincms.carlhansen.com/globalassets/products/chairs/e005/embrace-chair-eg-saebe-loke7748.png?aspect=16:9&device=desktop&size=medium&display=standard
https://www.dan-form.com/media/h2vavjhh/embrace-chair-vintage-grey-art-leather-with-black-metal-legs-100801530-02-front.png?width=1920
*/


*/

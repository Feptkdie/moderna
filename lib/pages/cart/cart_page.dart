import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mod/helpers/app_preferences.dart';

class CartPage extends StatefulWidget {
  static String routeName = "/cart_page";
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int count = 1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height * 0.07,
            width: width * 0.9,
            child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              backgroundColor: Colors.black,
              heroTag: null,
              onPressed: () {
                AppPreferences.showSnackBar(
                  "Та эхлээд нэвтэрнэ үү",
                  scaffoldKey,
                );
              },
              label: Text(
                "Худалдан авалт хийх",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.022,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            _top(height, width),
            _items(height, width),
          ],
        ),
      ),
    );
  }

  Widget _items(double height, double width) => Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height * 0.14,
                    width: width * 0.9,
                    child: Stack(
                      children: [
                        Container(
                          width: width * 0.9,
                          child: Row(
                            children: [
                              Container(
                                height: height * 0.14,
                                width: width * 0.32,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: height * 0.12,
                                          width: width * 0.32,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "https://admincms.carlhansen.com/globalassets/products/chairs/e005/embrace-chair-eg-saebe-loke7748.png?aspect=16:9&device=desktop&size=medium&display=standard",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  left: 8.0,
                                  right: 8.0,
                                  bottom: height * 0.024,
                                ),
                                child: Container(
                                  width: width * 0.38,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Jingle",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Germany",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey[500],
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                color: Colors.transparent,
                                              ),
                                              onPressed: () {},
                                            ),
                                            Container(
                                              height: height * 0.05,
                                              width: height * 0.05,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  width: 1.0,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "",
                                                  style: TextStyle(
                                                    fontSize: height * 0.024,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.transparent,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              16.0,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/product_detail");
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: height * 0.06,
                              left: width * 0.03,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (count > 1) count--;
                                    });
                                  },
                                ),
                                Container(
                                  height: height * 0.05,
                                  width: height * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      count.toString(),
                                      style: TextStyle(
                                        fontSize: height * 0.024,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Text(
                              "x",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: height * 0.024,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                              padding: EdgeInsets.only(
                                left: width * 0.21,
                                bottom: height * 0.02,
                              ),
                              child: Text(
                                "500.000₮",
                                style: TextStyle(fontSize: height * 0.02),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      );

  Widget _top(double height, double width) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.09,
              left: width * 0.02,
              right: width * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Сагс",
                  style: TextStyle(
                    fontSize: height * 0.021,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.ac_unit,
                    color: Colors.transparent,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.024),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black.withOpacity(
              0.2,
            ),
          ),
        ],
      );
}

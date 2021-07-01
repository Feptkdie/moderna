import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moderna/constants.dart';
import 'package:moderna/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteDetail extends StatefulWidget {
  static String routeName = "/product_detail";
  final ProductModel product;
  const FavoriteDetail({Key key, this.product}) : super(key: key);

  @override
  _FavoriteDetailState createState() => _FavoriteDetailState();
}

class _FavoriteDetailState extends State<FavoriteDetail> {
  int count = 1;
  bool isCheck = false;
  bool showDescription = true;
  String checkCalls;
  final _user = json.decode(Data.user);
  List<ProductModel> favList;
  List<ProductModel> favList2;

  Future<void> _saveProduct() async {
    final prefs = await SharedPreferences.getInstance();
    String prebString = "fav";
    // prefs.clear();

    if (_user != null) prebString += _user["user"]["id"].toString();

    List<ProductModel> favList2 = <ProductModel>[];
    String checkCalls2 = (prefs.getString(prebString) ?? null);

    if (checkCalls2 != null) {
      favList2 = (json.decode(checkCalls2) as List)
          .map((call) => ProductModel.fromJson(call))
          .toList();
    }

    var existingCall = favList2.firstWhere(
        (favCall) => favCall.id == widget.product.id,
        orElse: () => null);

    if (widget.product.isFavorite) {
      if (existingCall == null) {
        favList2.add(widget.product);
      }
    } else {
      if (existingCall != null) {
        favList2.removeWhere((favCall) => favCall.id == widget.product.id);
      }
    }

    String encodeCalls = json.encode(
      favList2.map<Map<String, dynamic>>((call) => call.toMap(call)).toList(),
    );
    // print(encodeCalls);
    prefs.setString(prebString, encodeCalls);

    checkCalls = prefs.getString(prebString) ?? null;

    if (checkCalls != null) {
      favList = (json.decode(checkCalls) as List)
          .map((call) => ProductModel.fromJson(call))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: [
              _image(height, width, widget.product),
              _topBar(height, width),
              _information(height, width, widget.product),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buyButton(double height, double width) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.03,
            bottom: height * 0.08,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              18.0,
            ),
            child: Container(
              height: height * 0.072,
              width: width * 0.9,
              child: Material(
                color: Colors.black,
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      "Сагсанд нэмэх",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _information(double height, double width, ProductModel product) =>
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.51,
            left: width * 0.06,
            right: width * 0.06,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.024,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/ar_page");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("         "),
                            Image.asset(
                              "assets/bottom3.png",
                              height: height * 0.04,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Center(
                              child: Text(
                                "AR View",
                                style: TextStyle(
                                  fontSize: height * 0.02,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.subtitle,
                  style: TextStyle(
                    color: Colors.grey[700].withOpacity(0.5),
                    fontSize: height * 0.016,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 36.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (product.count > 1) product.count--;
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
                            product.count.toString(),
                            style: TextStyle(
                              fontSize: height * 0.024,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            product.count++;
                          });
                        },
                      ),
                    ],
                  ),
                  if (product.price != null)
                    Text(
                      product.price,
                      style: TextStyle(fontSize: height * 0.03),
                    ),
                  if (product.price == null) Text(""),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Бүтээгдэхүүний\nдэлгэрэнгүй",
                      style: TextStyle(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (!showDescription)
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        iconSize: height * 0.02,
                        onPressed: () {
                          setState(() {
                            showDescription = true;
                          });
                        },
                      ),
                    if (showDescription)
                      IconButton(
                        icon: RotationTransition(
                          turns: AlwaysStoppedAnimation(90 / 360),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                        iconSize: height * 0.02,
                        onPressed: () {
                          setState(() {
                            showDescription = false;
                          });
                        },
                      ),
                  ],
                ),
              ),
              if (showDescription)
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Text(
                    """${product.content.toString()}""",
                    textAlign: TextAlign.justify,
                  ),
                ),
              _buyButton(height, width),
            ],
          ),
        ),
      );

  Widget _image(double height, double width, ProductModel product) => Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(26.0),
                bottomRight: Radius.circular(26.0),
              ),
              child: Container(
                height: height * 0.48,
                width: height,
                color: Color(0xFFF2F3F2),
                child: Text(""),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.18),
                child: Container(
                  height: height * 0.24,
                  width: height * 0.4,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: height * 0.24,
                      width: height * 0.4,
                      child: Image.network(
                        product.filePath.toString(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
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
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.black,
                  ),
                  Text(
                    "           ",
                    style: TextStyle(
                      color: Colors.grey[800].withOpacity(
                        0.8,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.02,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width * 0.44,
              ),
              if (widget.product.isFavorite)
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {
                        widget.product.isFavorite = false;
                        _saveProduct();
                        setState(() {});
                      },
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: width * 0.06,
                    ),
                  ],
                ),
              if (!widget.product.isFavorite)
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        widget.product.isFavorite = true;
                        _saveProduct();
                        setState(() {});
                      },
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: width * 0.06,
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
}
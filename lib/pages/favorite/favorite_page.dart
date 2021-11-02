import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moderna/models/product_model.dart';
import 'package:moderna/pages/favorite/favorite_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class FavoritePage extends StatefulWidget {
  static String routeName = "/favorite_page";
  const FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<ProductModel> favList2 = [];
  bool isCheck = false;
  final _user = json.decode(Data.user);

  Future<void> _saveProduct(int index) async {
    final prefs = await SharedPreferences.getInstance();
    String prebString = "fav";
    // prefs.clear();

    if (_user != null) prebString += _user["user"]["id"].toString();

    var existingCall = favList2.firstWhere(
        (favCall) => favCall.id == favList2[index].id,
        orElse: () => null);

    if (existingCall != null) {
      favList2.removeWhere((favCall) => favCall.id == favList2[index].id);
    }

    String encodeCalls = json.encode(
      favList2.map<Map<String, dynamic>>((call) => call.toMap(call)).toList(),
    );
    // print(encodeCalls);

    setState(() {
      prefs.setString(prebString, encodeCalls);
    });
  }

  Future<void> _isFavoriteCheck() async {
    final prefs = await SharedPreferences.getInstance();
    String prebString = "fav";
    // prefs.clear();

    if (_user != null) prebString += _user["user"]["id"].toString();

    String checkCalls = prefs.getString(prebString) ?? null;

    if (checkCalls != null) {
      favList2 = (json.decode(checkCalls) as List)
          .map((call) => ProductModel.fromJson(call))
          .toList();

      setState(() {
        isCheck = true;
      });
    }
  }

  @override
  void initState() {
    _isFavoriteCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            _top(height, width),
            if (isCheck) _items(height, width),
          ],
        ),
      ),
    );
  }

  Widget _items(double height, double width) => Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: favList2.length,
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
                                            imageUrl: favList2[index].filePath,
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
                                          favList2[index].title,
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
                                          favList2[index].categoryText,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey[500],
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.02),
                                      if (favList2[index].price != null)
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            favList2[index].price.toString(),
                                            style: TextStyle(
                                                fontSize: height * 0.02),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FavoriteDetail(
                                        product: favList2[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: width * 0.02,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                favList2[index].isFavorite = false;
                                _saveProduct(index);
                              },
                            ),
                          ),
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

  Widget _top(double height, double width) => Padding(
        padding: EdgeInsets.only(
          top: height * 0.07,
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
              "Хүслийн",
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
      );
}

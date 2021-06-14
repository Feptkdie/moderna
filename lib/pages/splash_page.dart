import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mod/models/banner_model.dart';
import 'package:mod/models/categories_model.dart';
import 'package:mod/models/product_model.dart';

import '../constants.dart';

class SplashPage extends StatefulWidget {
  static String routeName = "/splash_page";

  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var response;
  // Serverees productuudiig duudan hadgalj baina
  Future<void> _initDataFromServer() async {
    response = await http.get("http://admin.moderna.mn/api/get-data", headers: {
      // "Authorization": "Bearer ${Data.userToken}",
      "Content-Type": "application/json"
    });

    try {
      var _last;
      _last = json.decode(response.body);
      final _productData = json.encode(_last["infos"]);
      final _categoryData = json.encode(_last["categories"]);
      final _bannerData = json.encode(_last["banner"]["original"]);
      List _items = json.decode(_productData);
      Data.productItems.clear();
      _items.forEach((element) {
        ProductModel item = ProductModel(
            id: element["id"],
            title: element["title"].toString(),
            subtitle: element["subtitle"].toString(),
            fileMode: element["fileMode"].toString(),
            filePath: element["filePath"].toString(),
            content: element["content"].toString(),
            createdAt: element["createdAt"].toString(),
            categories: element["categories"] ?? [],
            isSaw: false,
            download_count: null,
            model: null,
            view_count: null,
            price: element["price"]);

        Data.productItems.add(item);
      });

      Data.categoryItems.clear();
      _items.clear();
      _items = json.decode(_categoryData);
      _items.forEach((element) {
        CategoriesModel item = CategoriesModel(
          id: element["id"],
          name: element["name"],
          image: element["image"],
          createdAt: element["createdAt"],
        );

        Data.categoryItems.add(item);
      });

      Data.bannerItems.clear();
      _items.clear();
      _items = json.decode(_bannerData);
      _items.forEach((element) {
        BannerModel item = BannerModel(image: element["image"]);
        Data.bannerItems.add(item);
      });

      Navigator.pushReplacementNamed(context, "/onboard_page");
    } catch (e) {
      print("splash_page/ " + e.toString());
    }
  }

  // Huudas unshihad ajilah function
  @override
  void initState() {
    _initDataFromServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Colors.black.withOpacity(0.94),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: width * 0.8,
                child: Image.asset("assets/white_logo.png"),
              ),
              Text(
                "Тавилгын ертөнцыг таны гар утсанд",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w300,
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

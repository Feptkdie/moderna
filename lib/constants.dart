import 'package:flutter/material.dart';
import './models/product_model.dart';
import 'models/banner_model.dart';
import 'models/categories_model.dart';

Color kPrimaryColor = Colors.blue[800];
const kBackgroundColor = Colors.white;
const kBackgroundColor2 = Color(0xFFF9F8FD);

class Data {
  static String userToken = "";
  static List<ProductModel> productItems = [];
  static List<CategoriesModel> categoryItems = [];
  static List<BannerModel> bannerItems = [];
  static bool isUnityLoad = false;
}

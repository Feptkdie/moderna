import 'package:flutter/material.dart';
import 'package:moderna/models/product_model.dart';

class HomeModel with ChangeNotifier {
  String id;
  String name;
  String image;
  List<ProductModel> product;

  HomeModel({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.product,
  });
}

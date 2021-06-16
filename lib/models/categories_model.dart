import 'package:flutter/material.dart';

class CategoriesModel with ChangeNotifier {
  String id;
  String name;
  String image;
  String createdAt;

  CategoriesModel({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.createdAt,
  });
}

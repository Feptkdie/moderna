import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  int id;
  String title;
  String subtitle;
  String fileMode;
  String filePath;
  String download_count;
  String view_count;
  String price;
  bool isSaw;
  String model;
  String content;
  String createdAt;
  List categories;

  ProductModel({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.fileMode,
    @required this.filePath,
    @required this.download_count,
    @required this.view_count,
    @required this.isSaw,
    @required this.price,
    @required this.model,
    @required this.content,
    @required this.createdAt,
    @required this.categories,
  });
}

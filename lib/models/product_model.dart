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
  bool isFavorite;
  bool isCart;
  int count;

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
    @required this.count,
    @required this.isFavorite,
    @required this.isCart,
  });

  Map<String, dynamic> toMap(ProductModel call) => {
        'id': call.id,
        'title': call.title,
        "subtitle": call.subtitle,
        "fileMode": call.fileMode,
        "filePath": call.filePath,
        "download_count": call.download_count,
        "view_count": call.view_count,
        "isSaw": call.isSaw,
        "price": call.price,
        "model": call.model,
        "content": call.content,
        "createdAt": call.createdAt,
        "categories": call.categories,
        "count": call.count,
        "isFavorite": call.isFavorite,
        "isCart": call.isCart,
      };

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        fileMode: json["fileMode"],
        filePath: json["filePath"],
        download_count: json["download_count"],
        view_count: json["view_count"],
        isSaw: json["isSaw"],
        price: json["price"],
        model: json["model"],
        content: json["content"],
        createdAt: json["createdAt"],
        categories: json["categories"],
        count: json["count"],
        isFavorite: json["isFavorite"],
        isCart: json["isCart"]);
  }
}

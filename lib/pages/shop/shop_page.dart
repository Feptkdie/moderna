import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class ShopPage extends StatefulWidget {
  static String routeName = "/shop_page";
  const ShopPage({Key key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool isShopOrBrand = true;
  final searchTEC = new TextEditingController();
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
            SizedBox(
              height: height * 0.03,
            ),
            _filter(height, width),
            _search(height, width, searchTEC),
            SizedBox(
              height: height * 0.03,
            ),
            if (isShopOrBrand) _shopItems(height, width),
            if (!isShopOrBrand) _brandItems(height, width),
          ],
        ),
      ),
    );
  }

  Widget _brandItems(double height, double width) => Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 0,
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (10 > index + index)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(
                              16.0,
                            ),
                            color: Colors.white,
                          ),
                          width: width * 0.42,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: height * 0.18,
                                width: width * 0.42,
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
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8qtutF9MfF_XErG6S5Lxfgit1B__xXLcW1g&usqp=CAU",
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
                                  child: Center(
                                    child: Text(
                                      "Kitchen all",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                                  Navigator.pushNamed(context, "/shop_items");
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (10 > index + index + 1)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            width: width * 0.42,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: height * 0.18,
                                  width: width * 0.42,
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
                                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8qtutF9MfF_XErG6S5Lxfgit1B__xXLcW1g&usqp=CAU",
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
                                    child: Center(
                                      child: Text(
                                        "Kitchen all",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/shop_items");
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );

  Widget _shopItems(double height, double width) => Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: Data.categoryItems.length,
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Data.categoryItems.length > index + index)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(
                              16.0,
                            ),
                            color: Colors.white,
                          ),
                          width: width * 0.42,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: height * 0.18,
                                width: width * 0.42,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: CachedNetworkImage(
                                          imageUrl: Data
                                              .categoryItems[index + index]
                                              .image,
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
                                  child: Center(
                                    child: Text(
                                      Data.categoryItems[index + index].name,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                                    context,
                                    "/shop_items",
                                    arguments: {'index': index + index},
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (Data.categoryItems.length > index + index + 1)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ),
                              color: Colors.white,
                            ),
                            width: width * 0.42,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: height * 0.18,
                                  width: width * 0.42,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: CachedNetworkImage(
                                            imageUrl: Data
                                                .categoryItems[
                                                    index + index + 1]
                                                .image,
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
                                    child: Center(
                                      child: Text(
                                        Data.categoryItems[index + index + 1]
                                            .name,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/shop_items",
                                    arguments: {'index': index + index + 1},
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );

  Widget _filter(double height, double width) => Container(
        width: width,
        child: Stack(
          children: [
            if (isShopOrBrand)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isShopOrBrand = false;
                    });
                  },
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.24,
                      ),
                      child: Container(
                        width: width * 0.3,
                        height: height * 0.034,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            18.0,
                          ),
                          border: Border.all(
                            width: 1.0,
                            color: Colors.black,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  isShopOrBrand = false;
                                });
                              },
                              child: Center(
                                child: Text(
                                  "Бренд",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (isShopOrBrand)
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: width * 0.24,
                  ),
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.034,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        18.0,
                      ),
                      color: Color(0xFF393938),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        18.0,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              "Дэлгүүр",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (!isShopOrBrand)
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: width * 0.24,
                  ),
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.034,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        18.0,
                      ),
                      color: Colors.white,
                      border: Border.all(
                        width: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isShopOrBrand = true;
                            });
                          },
                          child: Center(
                            child: Text(
                              "Дэлгүүр",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (!isShopOrBrand)
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.24,
                  ),
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.034,
                    decoration: BoxDecoration(
                      color: Color(0xFF393938),
                      borderRadius: BorderRadius.circular(
                        18.0,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            "Бренд",
                            style: TextStyle(
                              color: Colors.white,
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
      );

  Widget _search(
          double height, double width, TextEditingController _searchTEC) =>
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.04),
          child: Container(
            width: width * 0.8,
            height: height * 0.06,
            decoration: BoxDecoration(
              color: Color(0xFFF2F3F2),
              borderRadius: BorderRadius.circular(
                16.0,
              ),
            ),
            child: Center(
              child: TextField(
                controller: _searchTEC,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    top: 12.0,
                  ),
                  isDense: true,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
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
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "Бүтээгдэхүүн хайх",
              style: TextStyle(
                fontSize: height * 0.021,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
              ),
              onPressed: () {},
            ),
          ],
        ),
      );
}

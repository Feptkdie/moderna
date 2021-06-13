import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShopItems extends StatefulWidget {
  static String routeName = "/shop_items";
  const ShopItems({Key key}) : super(key: key);

  @override
  _ShopItemsState createState() => _ShopItemsState();
}

class _ShopItemsState extends State<ShopItems> {
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
                                  child: Center(
                                    child: Text(
                                      "Jingle",
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
                                      context, "/product_detail");
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
                                    child: Center(
                                      child: Text(
                                        "Jingle",
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
                                      context, "/product_detail");
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

  Widget _top(double height, double width) => Padding(
        padding: EdgeInsets.only(
          top: height * 0.08,
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
              "Буйдан",
              style: TextStyle(
                fontSize: height * 0.021,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                Navigator.pushNamed(context, "/shop_filter");
              },
            ),
          ],
        ),
      );
}

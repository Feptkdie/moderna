import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  static String routeName = "/favorite_page";
  const FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
          itemCount: 0,
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Jingle",
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
                                          "Germany",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey[500],
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.02),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "500.000₮",
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
                                  Navigator.pushNamed(
                                      context, "/product_detail");
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
                              onPressed: () {},
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
          top: height * 0.09,
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

import 'package:flutter/material.dart';

Widget _item(double height, double width, int index) => Padding(
      padding: EdgeInsets.only(
        top: height * 0.02,
        bottom: height * 0.02,
      ),
      child: Container(
        height: height * 0.21,
        width: width * 0.8,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    18.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    18.0,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.18,
                        width: width * 0.8,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      14.0,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: width * 0.06,
                                    left: width * 0.06,
                                    top: 6.0,
                                    bottom: 6.0,
                                  ),
                                  child: Text("56 &"),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.06,
                                  bottom: height * 0.05,
                                ),
                                child: Container(
                                  width: width * 0.3,
                                  child: Text(
                                    "Classic Leather Arm Chair",
                                    style: TextStyle(
                                      fontSize: height * 0.02,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Navigator.pushNamed(
                            //   context,
                            //   "/product_detail",
                            //   arguments: {'index': index},
                            // );
                          },
                          child: Container(
                            height: height * 0.18,
                            width: width * 0.8,
                            color: Colors.transparent,
                            child: Text(""),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: width * 0.04,
                  bottom: height * 0.01,
                ),
                child: Container(
                  height: height * 0.6,
                  child: Image.network(
                    "https://admincms.carlhansen.com/globalassets/products/chairs/e005/embrace-chair-eg-saebe-loke7748.png?aspect=16:9&device=desktop&size=medium&display=standard",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

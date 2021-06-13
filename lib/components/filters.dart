import 'package:flutter/material.dart';

Widget _filters(double height, double width, int currentFilterIndex) => Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.28, left: width * 0.1),
        child: Container(
          width: width,
          height: height * 0.04,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Column(
              children: [
                if (index == currentFilterIndex)
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8.0,
                      left: 8.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // setState(() {
                            currentFilterIndex = index;
                            // });
                          },
                          child: Container(
                            height: height * 0.04,
                            color: Colors.white.withOpacity(0.6),
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 28.0,
                                left: 28.0,
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                "All",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (index != currentFilterIndex)
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8.0,
                      left: 8.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // setState(() {
                            currentFilterIndex = index;
                            // });
                          },
                          child: Container(
                            height: height * 0.04,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 28.0,
                                left: 28.0,
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                "All",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
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
          ),
        ),
      ),
    );

import 'package:flutter/material.dart';

import '../constants.dart';

Widget _endDrawer(double height, double width) => Container(
      width: width * 0.6,
      child: Drawer(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.0,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: kPrimaryColor,
                  onTap: () {
                    // Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: width * 0.14,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.home,
                          ),
                          Text(
                            "  Нүүр хуудас",
                            style: TextStyle(
                              fontSize: width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: kPrimaryColor,
                  onTap: () {
                    // Navigator.pushNamed(context, "/profile_page");
                  },
                  child: Container(
                    width: double.infinity,
                    height: width * 0.14,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                          ),
                          Text(
                            "  Profile",
                            style: TextStyle(
                              fontSize: width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: kPrimaryColor,
                  onTap: () {
                    // Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: width * 0.14,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                          ),
                          Text(
                            "  Shopping cart",
                            style: TextStyle(
                              fontSize: width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: kPrimaryColor,
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: width * 0.14,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_add,
                          ),
                          Text(
                            "  Хамтарч ажиллах",
                            style: TextStyle(
                              fontSize: width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (Data.userToken.isNotEmpty)
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: kPrimaryColor,
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: width * 0.14,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_add,
                            ),
                            Text(
                              "  Sign out",
                              style: TextStyle(
                                fontSize: width * 0.04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: kPrimaryColor,
                  onTap: () {
                    // launch(
                    //   "tel://99115351",
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    height: width * 0.14,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            height: height * 0.038,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.black38,
                              ),
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: Center(
                                child: Text(
                                  "99115352",
                                  style: TextStyle(
                                    fontSize: width * 0.046,
                                    fontWeight: FontWeight.bold,
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
              ),
            ],
          ),
        ),
      ),
    );

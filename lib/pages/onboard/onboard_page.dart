import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class OnboardPage extends StatefulWidget {
  static String routeName = "/onboard_page";
  const OnboardPage({Key key}) : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  checkUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    if (prefs.containsKey("user")) {
      var user = prefs.getString("user") ?? "null";
      print("user = " + user);
      if (user != "null") {
        Data.user = user;
        Navigator.pushReplacementNamed(context, "/home_page");
      }
    }
  }

  @override
  void initState() {
    checkUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            Container(
              height: height,
              width: width,
              child: Image.asset("assets/onboard.png", fit: BoxFit.cover),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "assets/buidan.png",
                    height: height * 0.08,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    width: width * 0.8,
                    child: Text(
                      "Манай дэлгүүрт тавтай морил",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.height * 0.042,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Text(
                    "Тавилгаа хурдан бөгөөд хялбархан аваарай",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      18.0,
                    ),
                    child: Container(
                      height: height * 0.082,
                      width: width * 0.76,
                      child: Material(
                        color: Colors.black,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, "/login_page");
                          },
                          child: Center(
                            child: Text(
                              "Эхэлцгээе",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.084,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

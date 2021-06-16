import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:mod/constants.dart';
import 'package:http/http.dart' as http;

class ArPage extends StatefulWidget {
  static String routeName = "/ar_page";
  const ArPage({Key key}) : super(key: key);

  @override
  _ArPageState createState() => _ArPageState();
}

class _ArPageState extends State<ArPage> {
  UnityWidgetController _controller;

  void onUnityCreated(controller) {
    this._controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: height,
            width: width,
            child: Column(
              children: <Widget>[
                _top(height, width),
                Expanded(
                  child: UnityWidget(
                    onUnityCreated: onUnityCreated,
                    fullscreen: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _top(double height, double width) => Padding(
        padding: EdgeInsets.only(
          top: height * 0.04,
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
              "",
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

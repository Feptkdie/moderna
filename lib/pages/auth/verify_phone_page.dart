import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:mod/helpers/app_preferences.dart';

class VerifyPhonePage extends StatefulWidget {
  static String routeName = "/verify_phone_page";
  const VerifyPhonePage({Key key}) : super(key: key);

  @override
  _VerifyPhonePageState createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final codeTEC = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (codeTEC.text.length >= 4)
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/login_page_default",
              ModalRoute.withName('/'),
            );
          else
            AppPreferences.showSnackBar(
              "Баталгаажуулах код 4 оронтой байх ёстой",
              scaffoldKey,
            );
        },
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
        backgroundColor: codeTEC.text.length >= 4
            ? Colors.blue
            : Colors.black.withOpacity(0.4),
        elevation: 0,
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            // _background(height, width),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: height * 0.07,
                  left: width * 0.04,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
            _form(height, width),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: height * 0.028,
                  left: width * 0.048,
                ),
                child: Container(
                  height: height * 0.06,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        AppPreferences.showSnackBar(
                          "Хүсэлт илгээлээ!",
                          scaffoldKey,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Дахин код илгээх",
                            style: TextStyle(
                              fontSize: height * 0.022,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _form(double height, double width) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.062),
                  child: Text(
                    "4 оронтой кодоо оруулна уу",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.022,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.024,
              ),
              Container(
                width: width * 0.86,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: codeTEC,
                        onChanged: (value) {
                          if (value.length >= 4)
                            setState(() =>
                                print("LoginPage / phone number correct"));
                          else
                            setState(
                                () => print("LoginPage / phone number false"));
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: '- - - -',
                          hintStyle: TextStyle(fontSize: height * 0.03),
                          contentPadding: EdgeInsets.only(left: width * 0.028),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * 0.86,
                height: 2.0,
                color: Colors.black,
                child: Text(""),
              ),
            ],
          ),
        ),
      );

  // Widget _background(double height, double width) {
  //   return Container(
  //     height: height * 0.3,
  //     child: Stack(
  //       fit: StackFit.expand,
  //       children: [
  //         // Container(
  //         //   height: height * 0.3,
  //         //   width: width,
  //         //   child: Opacity(
  //         //     opacity: 0.4,
  //         //     child: Image.asset(
  //         //       "assets/verify_back_top.jpg",
  //         //       fit: BoxFit.cover,
  //         //     ),
  //         //   ),
  //         // ),
  //         DecoratedBox(
  //           decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //               begin: Alignment(0.0, 0.7),
  //               end: Alignment(0.0, 0.0),
  //               colors: <Color>[
  //                 Colors.white.withOpacity(0.8),
  //                 Colors.transparent,
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moderna/helpers/app_preferences.dart';
import '../../constants.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login_page";
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final phoneTEC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            _backgroundImages(height, width),
            _loginForm(height, width),
          ],
        ),
      ),
    );
  }

  Widget _loginForm(double height, double width) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: height * 0.1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: width * 0.86,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "   +976",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.018,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: phoneTEC,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        onChanged: (value) {
                          if (value.length >= 8)
                            setState(() =>
                                print("LoginPage / phone number correct"));
                          else
                            setState(
                                () => print("LoginPage / phone number false"));
                        },
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        maxLength: 8,
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: EdgeInsets.only(left: width * 0.028),
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (phoneTEC.text.length >= 8)
                          Navigator.pushNamed(context, "/verify_phone_page");
                        else
                          AppPreferences.showSnackBar(
                              "Дугаараа зөв оруулна уу", scaffoldKey);
                      },
                      icon: Icon(
                        Icons.send,
                        color: phoneTEC.text.length >= 8
                            ? Colors.blue
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * 0.86,
                height: 2.0,
                color: Colors.white,
                child: Text(""),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Or connect with social media",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w300,
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  18.0,
                ),
                child: Container(
                  height: height * 0.082,
                  width: width * 0.92,
                  child: Material(
                    color: Colors.blue[300],
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/login_page");
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/google_icon.png",
                              height: height * 0.032,
                            ),
                            SizedBox(
                              width: width * 0.08,
                            ),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  18.0,
                ),
                child: Container(
                  height: height * 0.082,
                  width: width * 0.92,
                  child: Material(
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/login_page");
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/facebook_icon.png",
                              height: height * 0.032,
                            ),
                            SizedBox(
                              width: width * 0.08,
                            ),
                            Text(
                              "Continue with Facebook",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
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

  Widget _backgroundImages(double height, double width) => Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            child: Image.asset(
              "assets/login_back.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: height,
            width: width,
            color: Colors.black.withOpacity(0.6),
            child: Text(""),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.16),
              child: Container(
                width: width * 0.76,
                child: Image.asset("assets/white_logo.png"),
              ),
            ),
          ),
        ],
      );
}

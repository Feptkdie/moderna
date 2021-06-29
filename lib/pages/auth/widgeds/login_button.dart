import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moderna/helpers/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class LoginButton extends StatefulWidget {
  final String email;
  final String password;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const LoginButton({
    Key key,
    this.email,
    this.password,
    this.scaffoldKey,
  }) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isLoad = false;
  Future<void> _login() async {
    setState(() {
      isLoad = true;
    });
    if (widget.email.isNotEmpty && widget.password.isNotEmpty) {
      var last = await http.post(
        Uri.parse("https://admin.moderna.mn/api/login"),
        // headers: {"Content-Type": "application/json"},
        body: {"email": widget.email, "password": widget.password},
      );
      if (json.decode(last.body)["error"] == "Unauthorized") {
        AppPreferences.showSnackBar(
            "Нэвтрэх имэйл эсвэл нууц үг буруу байна!", widget.scaffoldKey);
        setState(() {
          isLoad = false;
        });
      } else {
        if (last.statusCode == 200) {
          setState(() {
            isLoad = false;
          });
          Data.user = last.body;
          final prefs = await SharedPreferences.getInstance();

          prefs.setString("user", last.body.toString());

          Navigator.pushReplacementNamed(context, "/home_page");
        } else {
          setState(() {
            isLoad = false;
          });
          AppPreferences.showSnackBar(
              "Алдаа гарлаа дахин оролдоно уу!", widget.scaffoldKey);
        }
      }
    } else {
      setState(() {
        isLoad = false;
        AppPreferences.showSnackBar(
            "Бүх хэсэгийг бөглөнө үү!", widget.scaffoldKey);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        18.0,
      ),
      child: Container(
        height: height * 0.08,
        width: width * 0.9,
        child: Material(
          color: Colors.black,
          child: InkWell(
            onTap: () {
              if (!isLoad) _login();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isLoad)
                  Text(
                    "Нэвтрэх",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                if (isLoad)
                  CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                    strokeWidth: 2.0,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

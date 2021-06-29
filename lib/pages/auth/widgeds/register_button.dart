import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moderna/helpers/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class RegisterButton extends StatefulWidget {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const RegisterButton({
    Key key,
    this.email,
    this.password,
    this.scaffoldKey,
    this.firstName,
    this.lastName,
    this.phone,
  }) : super(key: key);

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  bool isLoad = false;
  Future<void> _register() async {
    if (widget.firstName.isNotEmpty &&
        widget.lastName.isNotEmpty &&
        widget.email.isNotEmpty &&
        widget.phone.isNotEmpty &&
        widget.password.isNotEmpty) {
      var last = await http.post(
        Uri.parse("https://admin.moderna.mn/api/register"),
        // headers: {"Content-Type": "application/json"},
        body: {
          "email": widget.email,
          "password": widget.password,
          "lastname": widget.lastName,
          "firstname": widget.firstName,
          "phone": widget.phone,
        },
      );
      if (json.decode(last.body)["error"] == "Unauthorized") {
        AppPreferences.showSnackBar(
            "Алдаа гарлаа дахин оролдоно уу!", widget.scaffoldKey);
      } else {
        if (last.statusCode == 200) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString("user", last.body.toString());

          Data.user = last.body;
          Navigator.pushReplacementNamed(context, "/home_page");
        } else {
          AppPreferences.showSnackBar(
              "Алдаа гарлаа дахин оролдоно уу!", widget.scaffoldKey);
        }
      }
    } else
      AppPreferences.showSnackBar(
          "Бүх хэсэгийг бөглөнө үү!", widget.scaffoldKey);
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
              if (!isLoad) _register();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isLoad)
                  Text(
                    "Бүртгүүлэх",
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

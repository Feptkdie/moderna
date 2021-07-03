import 'package:flutter/material.dart';

import 'package:moderna/pages/auth/widgeds/login_button.dart';

class LoginPageDefault extends StatefulWidget {
  static String routeName = "/login_page_default";
  const LoginPageDefault({Key key}) : super(key: key);

  @override
  _LoginPageDefaultState createState() => _LoginPageDefaultState();
}

class _LoginPageDefaultState extends State<LoginPageDefault> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final nameTEC = new TextEditingController();
  final passTEC = new TextEditingController();
  bool isShowPass = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: <Widget>[
              _loginForm(height, width),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm(double height, double width) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: width * 0.74,
                child: Image.asset(
                  "assets/white_logo.png",
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.046),
                  child: Text(
                    "Бүртгэл",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.046),
                  child: Text(
                    "Имэйл, нууц үгээ оруулна уу",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                      fontWeight: FontWeight.w300,
                      fontSize: MediaQuery.of(context).size.height * 0.019,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width * 0.91,
                child: TextField(
                  controller: nameTEC,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Имайл",
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                width: width * 0.91,
                height: 1.0,
                color: Colors.black,
                child: Text(""),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width * 0.91,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: passTEC,
                        obscureText: isShowPass,
                        decoration: InputDecoration(
                          labelText: "Нууц үг",
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (isShowPass)
                            isShowPass = false;
                          else
                            isShowPass = true;
                        });
                      },
                      icon: Icon(
                        isShowPass ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * 0.91,
                height: 1.0,
                color: Colors.black,
                child: Text(""),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.056),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Container(
                      height: height * 0.04,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              "Нууц үг мартсан?",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              LoginButton(
                email: nameTEC.text,
                password: passTEC.text,
                scaffoldKey: scaffoldKey,
              ),
              SizedBox(
                height: height * 0.028,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: height * 0.04,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/register_page");
                        },
                        child: Center(
                          child: Text(
                            "Бүртгэл байхгүй юу? Бүртгүүлэх",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moderna/pages/auth/widgeds/register_button.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = "/register_page";
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final nameTEC = new TextEditingController();
  final lastnameTEC = new TextEditingController();
  final emailTEC = new TextEditingController();
  final passTEC = new TextEditingController();
  final phoneTEC = new TextEditingController();
  bool isShowPass = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: <Widget>[
                _loginForm(height, width),
              ],
            ),
          ],
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
                    "Бүртгүүлэх",
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
                    "Бүртгэлээ үүсгэнэ үү",
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
                  controller: lastnameTEC,
                  decoration: InputDecoration(
                    labelText: "Хэрэглэгчийн нэр",
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
                child: TextField(
                  controller: nameTEC,
                  decoration: InputDecoration(
                    labelText: "Эцэг эхийн нэр",
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
                child: TextField(
                  controller: emailTEC,
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
                child: TextField(
                  controller: phoneTEC,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    labelText: "phone",
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
                padding: EdgeInsets.only(
                  top: height * 0.01,
                  right: width * 0.056,
                  left: width * 0.056,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: height * 0.04,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Үйлчилгээний нөхцөлтэй танилцана уу.",
                                          style: TextStyle(
                                            color: Colors.grey.withOpacity(
                                              0.7,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Privacy Policy.",
                                          style: TextStyle(
                                            color: Colors.grey.withOpacity(
                                              0.7,
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
                        ),
                        Text(""),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              RegisterButton(
                email: emailTEC.text,
                password: passTEC.text,
                phone: phoneTEC.text,
                firstName: nameTEC.text,
                lastName: lastnameTEC.text,
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
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Text(
                            "Таньд хаяг байгаа юу? Нэвтрэх",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
            ],
          ),
        ),
      );
}

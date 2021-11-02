import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moderna/helpers/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'user_payment.dart';

class ProfilePage extends StatefulWidget {
  static String routeName = "/profile_page";
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var _user;
  bool isCheck = false;

  _removeUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user", "null");
  }

  initUserData() {
    if (Data.user != null) _user = json.decode(Data.user);
    setState(() {
      isCheck = true;
    });
  }

  @override
  void initState() {
    // print(Data.user);
    initUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _top(height, width),
            if (isCheck) _information(height, width),
            if (!isCheck)
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.3),
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                    strokeWidth: 2.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _information(double height, double width) => Padding(
        padding: EdgeInsets.only(top: height * 0.014),
        child: Column(
          children: [
            Container(
              width: width,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Image.asset("assets/person.png"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/profile_page");
                      },
                      color: Colors.black,
                      iconSize: height * 0.07,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _user["user"]["lastname"],
                            style: TextStyle(
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _user["user"]["email"],
                            style: TextStyle(
                              fontSize: height * 0.014,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage2()));
              },
              leading: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              title: Text(
                "Захиалга",
                style: TextStyle(fontSize: height * 0.02),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                AppPreferences.showSnackBar("Тун удахгүй", scaffoldKey);
                // Navigator.pushNamed(context, "/user_info");
              },
              leading: Icon(
                Icons.person_pin_outlined,
                color: Colors.black,
              ),
              title: Text(
                "Миний дэлгэрэнгүй мэдээлэл",
                style: TextStyle(fontSize: height * 0.02),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                AppPreferences.showSnackBar("Тун удахгүй", scaffoldKey);
                // Navigator.pushNamed(context, "/user_location");
              },
              leading: Icon(
                Icons.location_pin,
                color: Colors.black,
              ),
              title: Text(
                "Хүргэлтийн хаяг",
                style: TextStyle(fontSize: height * 0.02),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                AppPreferences.showSnackBar("Тун удахгүй", scaffoldKey);
              },
              leading: Icon(
                Icons.payment,
                color: Colors.black,
              ),
              title: Text(
                "Төлбөр",
                style: TextStyle(fontSize: height * 0.02),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                AppPreferences.showSnackBar("Тун удахгүй", scaffoldKey);
              },
              leading: Icon(
                Icons.card_giftcard,
                color: Colors.black,
              ),
              title: Text(
                "Промо код",
                style: TextStyle(fontSize: height * 0.02),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                AppPreferences.showSnackBar("Мэдэгдэл алга", scaffoldKey);
              },
              leading: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
              title: Text(
                "Мэдэгдэл",
                style: TextStyle(fontSize: height * 0.02),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                AppPreferences.showSnackBar("Тун удахгүй", scaffoldKey);
              },
              leading: Icon(
                Icons.error_outline,
                color: Colors.black,
              ),
              title: Text(
                "Тусламж",
                style: TextStyle(fontSize: height * 0.02),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
            ),
            Divider(),
            SizedBox(height: height * 0.1),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                18.0,
              ),
              child: Container(
                height: height * 0.08,
                width: width * 0.9,
                child: Material(
                  color: Colors.black.withOpacity(0.1),
                  child: InkWell(
                    onTap: () {
                      _removeUserData();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "/login_page_default",
                          (Route<dynamic> route) => false);
                    },
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(Icons.exit_to_app),
                        ),
                        SizedBox(width: width * 0.1),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Системээс гарах",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.022,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      );

  Widget _top(double height, double width) => Padding(
        padding: EdgeInsets.only(
          top: height * 0.07,
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
              "Profile",
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

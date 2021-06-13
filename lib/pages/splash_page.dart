import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static String routeName = "/splash_page";

  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Serverees productuudiig duudan hadgalj baina
  Future<void> _initDataFromServer() async {
    Future.delayed(
      const Duration(milliseconds: 3500),
      () => Navigator.pushReplacementNamed(context, "/onboard_page"),
    );
  }

  // Huudas unshihad ajilah function
  @override
  void initState() {
    _initDataFromServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Colors.black.withOpacity(0.94),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: width * 0.8,
                child: Image.asset("assets/white_logo.png"),
              ),
              Text(
                "Тавилгын ертөнцыг таны гар утсанд",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w300,
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

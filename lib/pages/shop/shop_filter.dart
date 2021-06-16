import 'package:flutter/material.dart';

class ShopFilter extends StatefulWidget {
  static String routeName = "/shop_filter";
  const ShopFilter({Key key}) : super(key: key);

  @override
  _ShopFilterState createState() => _ShopFilterState();
}

class _ShopFilterState extends State<ShopFilter> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            _top(height, width),
            Expanded(
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F3F2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      28.0,
                    ),
                    topRight: Radius.circular(
                      28.0,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.04,
                            left: width * 0.08,
                          ),
                          child: Text(
                            "Ангилалууд",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        children: List.generate(
                          4,
                          (index) => Container(
                            child: CheckboxListTile(
                              activeColor: Colors.black,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Буйдан"),
                              dense: true,
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.03,
                            left: width * 0.08,
                          ),
                          child: Text(
                            "Бранд",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        children: List.generate(
                          4,
                          (index) => Container(
                            child: CheckboxListTile(
                              activeColor: Colors.black,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text("Буйдан"),
                              dense: true,
                              value: false,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            18.0,
                          ),
                          child: Container(
                            height: height * 0.072,
                            width: width * 0.9,
                            child: Material(
                              color: Colors.black,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Center(
                                  child: Text(
                                    "Шүүлтүүр хэрэглэх",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.024,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _top(double height, double width) => Padding(
        padding: EdgeInsets.only(
          top: height * 0.08,
          left: width * 0.02,
          right: width * 0.02,
          bottom: height * 0.03,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Text(
                "x",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.024,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "Шүүлтүүрүүд",
              style: TextStyle(
                fontSize: height * 0.021,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.transparent,
              ),
              onPressed: () {},
            ),
          ],
        ),
      );
}

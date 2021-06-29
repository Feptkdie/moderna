import 'package:flutter/material.dart';
import 'package:moderna/constants.dart';

class ProductDetail extends StatefulWidget {
  static String routeName = "/product_detail";
  const ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int count = 1;
  bool showDescription = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: [
              _image(height, width, arguments['index2']),
              _topBar(height, width),
              _information(height, width, arguments['index2']),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buyButton(double height, double width) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.03,
            bottom: height * 0.08,
          ),
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
                  onTap: () {},
                  child: Center(
                    child: Text(
                      "Сагсанд нэмэх",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _information(double height, double width, int index) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.51,
            left: width * 0.06,
            right: width * 0.06,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      Data.productItems[index].title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.024,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Data.isUnityLoad = true;
                          });
                          Navigator.pushNamed(context, "/ar_page");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("         "),
                            Image.asset(
                              "assets/bottom3.png",
                              height: height * 0.04,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Center(
                              child: Text(
                                "AR View",
                                style: TextStyle(
                                  fontSize: height * 0.02,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Data.productItems[index].subtitle,
                  style: TextStyle(
                    color: Colors.grey[700].withOpacity(0.5),
                    fontSize: height * 0.016,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 36.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (count > 1) count--;
                          });
                        },
                      ),
                      Container(
                        height: height * 0.05,
                        width: height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 1.0,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            count.toString(),
                            style: TextStyle(
                              fontSize: height * 0.024,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            count++;
                          });
                        },
                      ),
                    ],
                  ),
                  if (Data.productItems[index].price != null)
                    Text(
                      Data.productItems[index].price,
                      style: TextStyle(fontSize: height * 0.03),
                    ),
                  if (Data.productItems[index].price == null) Text(""),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Бүтээгдэхүүний\nдэлгэрэнгүй",
                      style: TextStyle(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (!showDescription)
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        iconSize: height * 0.02,
                        onPressed: () {
                          setState(() {
                            showDescription = true;
                          });
                        },
                      ),
                    if (showDescription)
                      IconButton(
                        icon: RotationTransition(
                          turns: AlwaysStoppedAnimation(90 / 360),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                        iconSize: height * 0.02,
                        onPressed: () {
                          setState(() {
                            showDescription = false;
                          });
                        },
                      ),
                  ],
                ),
              ),
              if (showDescription)
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Text(
                    """${Data.productItems[index].content.toString()}""",
                    textAlign: TextAlign.justify,
                  ),
                ),
              _buyButton(height, width),
            ],
          ),
        ),
      );

  Widget _image(double height, double width, int index) => Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(26.0),
                bottomRight: Radius.circular(26.0),
              ),
              child: Container(
                height: height * 0.48,
                width: height,
                color: Color(0xFFF2F3F2),
                child: Text(""),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.18),
                child: Container(
                  height: height * 0.24,
                  width: height * 0.4,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: height * 0.24,
                      width: height * 0.4,
                      child: Image.network(
                        Data.productItems[index].filePath.toString(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _topBar(double height, double width) => Padding(
        padding: EdgeInsets.only(top: height * 0.07),
        child: Container(
          width: width,
          height: height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "",
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.black,
                  ),
                  Text(
                    "           ",
                    style: TextStyle(
                      color: Colors.grey[800].withOpacity(
                        0.8,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: height * 0.02,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width * 0.44,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: width * 0.06,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

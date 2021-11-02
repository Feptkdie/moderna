import 'package:flutter/material.dart';

import '../constants.dart';

Widget _backgroundContainers(double height, double width) => Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: height * 0.5,
            width: width,
            color: kPrimaryColor,
            child: Text(""),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.4),
            child: Container(
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              height: height * 0.2,
              width: width,
              child: Text(""),
            ),
          ),
        ),
      ],
    );

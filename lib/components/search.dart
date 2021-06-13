import 'package:flutter/material.dart';

Widget _search(double height, double width, TextEditingController _searchTEC) =>
    Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.18),
        child: Container(
          width: width * 0.8,
          height: height * 0.06,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(
              8.0,
            ),
          ),
          child: Center(
            child: TextField(
              controller: _searchTEC,
              decoration: InputDecoration(
                hintText: "хайх..",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  top: 10.0,
                ),
                isDense: true,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );

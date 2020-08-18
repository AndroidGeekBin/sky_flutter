import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTitle(
  String title,
    Color titleColor,
) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text(
          title,
        style: TextStyle(
          color: titleColor,
          fontSize:16
        ),
      ),
      leading: Container(
        child: Image.asset('images/common_left_back.png'),
      )
    ),
  );
}

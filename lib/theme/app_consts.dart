import 'package:flutter/material.dart';

class AppConsts {
  static List colors = const [
    Color(0xffc91c22),
    Color(0xff003e90),
    Color(0xffed1e79),
    Color(0xffcf7e48),
    Color(0xff4882cf),
    Color(0xfff2d352)
  ];

  static List radiusTopLeft = const [
    Radius.circular(30),
    Radius.circular(30),
    Radius.circular(30),
    Radius.circular(0),
    Radius.circular(30),
    Radius.circular(0),
  ];
  static List radiusTopRight = const [
    Radius.circular(30),
    Radius.circular(30),
    Radius.circular(0),
    Radius.circular(30),
    Radius.circular(0),
    Radius.circular(30),
  ];
  static List radiusBottomLeft = const [
    Radius.circular(30),
    Radius.circular(0),
    Radius.circular(30),
    Radius.circular(0),
    Radius.circular(30),
    Radius.circular(30),
  ];
  static List radiusBottomRight = const [
    Radius.circular(0),
    Radius.circular(30),
    Radius.circular(0),
    Radius.circular(30),
    Radius.circular(30),
    Radius.circular(30),
  ];
  static List images = const [
    "assets/ball.png",
    "assets/Politics.png",
    "assets/health.png",
    "assets/bussines.png",
    "assets/environment.png",
    "assets/science.png"
  ];
  static List titles = const [
    "Sports",
    "Politics",
    "Health",
    "Business",
    "Enviroment",
    "Science"
  ];
}

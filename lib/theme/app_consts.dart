import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class AppConsts {
  static List<CategoryModel> categoryModel = const [
    CategoryModel(
        id: "1",
        image: "assets/ball.png",
        title: "Sports",
        color: Color(0xffc91c22)),
    CategoryModel(
        id: "2",
        image: "assets/Politics.png",
        title: "Politics",
        color: Color(0xff003e90)),
    CategoryModel(
        id: "3",
        image: "assets/health.png",
        title: "Health",
        color: Color(0xffed1e79)),
    CategoryModel(
        id: "4",
        image: "assets/bussines.png",
        title: "Business",
        color: Color(0xffcf7e48)),
    CategoryModel(
        id: "5",
        image: "assets/environment.png",
        title: "Enviroment",
        color: Color(0xff4882cf)),
    CategoryModel(
        id: "6",
        image: "assets/science.png",
        title: "Science",
        color: Color(0xfff2d352))
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
}

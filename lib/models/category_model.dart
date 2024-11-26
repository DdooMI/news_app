import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String image;
  final String title;
  final Color color;

  const CategoryModel(
      {required this.image,
      required this.title,
      required this.color,
      required this.id});
}

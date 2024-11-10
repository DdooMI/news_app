import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/category_model.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryCard(
      {required this.topLeft,
      required this.topRight,
      required this.bottomLeft,
      required this.bottomRight,
      required this.categoryModel,
      super.key});

  Radius topLeft;
  Radius topRight;
  Radius bottomLeft;
  Radius bottomRight;
  CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
              topLeft: topLeft,
              topRight: topRight,
              bottomLeft: bottomLeft,
              bottomRight: bottomRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryModel.image,
            height: 120.h,
            width: 130.w,
            fit: BoxFit.contain,
          ),
          Text(
            categoryModel.title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}

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
      this.entertainment,
      super.key});

  Radius topLeft;
  Radius topRight;
  Radius bottomLeft;
  Radius bottomRight;
  CategoryModel categoryModel;
  final String? entertainment;

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
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.asset(
                categoryModel.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            categoryModel.title,
            style: entertainment != 'entertainment'
                ? Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white)
                : Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

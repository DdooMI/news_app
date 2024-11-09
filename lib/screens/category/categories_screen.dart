import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/widgets/category_card.dart';
import 'package:news_app/theme/app_consts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 35.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category\nof interest",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 25.w,
                      crossAxisSpacing: 20.h,
                      crossAxisCount: 2),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      topLeft: AppConsts.radiusTopLeft[index],
                      topRight: AppConsts.radiusTopRight[index],
                      bottomLeft: AppConsts.radiusBottomLeft[index],
                      bottomRight: AppConsts.radiusBottomRight[index],
                      color: AppConsts.colors[index],
                      title: AppConsts.titles[index],
                      image: AppConsts.images[index],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

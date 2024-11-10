import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/widgets/category_card.dart';
import 'package:news_app/theme/app_consts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onSelect});
  final Function(String) onSelect;

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
                    return GestureDetector(
                      onTap: () => onSelect(AppConsts.categoryModel[index].id),
                      child: CategoryCard(
                        topLeft: AppConsts.radiusTopLeft[index],
                        topRight: AppConsts.radiusTopRight[index],
                        bottomLeft: AppConsts.radiusBottomLeft[index],
                        bottomRight: AppConsts.radiusBottomRight[index],
                        categoryModel: AppConsts.categoryModel[index],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

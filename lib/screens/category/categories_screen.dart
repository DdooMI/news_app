import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/widgets/category_card.dart';
import 'package:news_app/theme/app_consts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onSelect});
  final Function(CategoryModel) onSelect;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryModel = const [
      CategoryModel(
          id: "sports",
          image: "assets/ball.png",
          title: "Sports",
          color: Color(0xffc91c22)),
      CategoryModel(
          id: "general",
          image: "assets/Politics.png",
          title: "general",
          color: Color(0xff003e90)),
      CategoryModel(
          id: "health",
          image: "assets/health.png",
          title: "Health",
          color: Color(0xffed1e79)),
      CategoryModel(
          id: "business",
          image: "assets/bussines.png",
          title: "Business",
          color: Color(0xffcf7e48)),
      CategoryModel(
          id: "entertainment",
          image: "assets/environment.png",
          title: "Entertainment",
          color: Color(0xff4882cf)),
      CategoryModel(
          id: "science",
          image: "assets/science.png",
          title: "Science",
          color: Color(0xfff2d352))
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 35.w),
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
                      mainAxisSpacing: 20.w,
                      crossAxisSpacing: 20.h,
                      crossAxisCount: 2),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => onSelect(categoryModel[index]),
                      child: SizedBox(
                        child: CategoryCard(
                          entertainment: categoryModel[index].id,
                          topLeft: AppConsts.radiusTopLeft[index],
                          topRight: AppConsts.radiusTopRight[index],
                          bottomLeft: AppConsts.radiusBottomLeft[index],
                          bottomRight: AppConsts.radiusBottomRight[index],
                          categoryModel: categoryModel[index],
                        ),
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

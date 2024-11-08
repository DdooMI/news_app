import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/widgets/category_card.dart';
import 'package:news_app/screens/widgets/custom_drawer.dart';
import 'package:news_app/theme/app_consts.dart';
import 'package:news_app/theme/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 35.w),
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(AppImages.mainBackground))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pick your category\nof interest",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Expanded(
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
            )
          ],
        ),
      ),
    );
  }
}

enum DrawerItem { categories, settings }

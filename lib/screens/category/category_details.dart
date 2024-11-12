import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/category/category_details_card.dart';
import 'package:news_app/theme/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.id});
  final String id;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedSubCatId = 0;

  List news = List.generate(
      5,
      (index) => NewsModel(
          id: index.toString(),
          title: "Why are football's biggest clubs starting a new tournament?",
          publisher: "BBC news",
          time: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            DateTime.now().hour,
            DateTime.now().minute,
          ),
          image: "assets/NewsTest.png"));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: ChoiceChip(
                  onSelected: (value) {
                    selectedSubCatId = index;
                    setState(() {});
                  },
                  label: Text("choice $index"),
                  selected: index == selectedSubCatId,
                  showCheckmark: false,
                  labelStyle: index == selectedSubCatId
                      ? Theme.of(context).textTheme.bodyMedium
                      : null,
                  selectedColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      side: BorderSide(color: AppColors.primary)),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 10,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CategoryDetailsCard(
                newsModel: news[index],
              );
            },
            itemCount: 5,
          ),
        )
      ],
    );
  }
}

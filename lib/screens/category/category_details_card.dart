import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_model.dart';

class CategoryDetailsCard extends StatelessWidget {
  const CategoryDetailsCard({required this.newsModel, super.key});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('hh:mm dd/MM');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              newsModel.image,
              height: 230.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                newsModel.publisher,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Text(newsModel.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Text(dateFormat.format(newsModel.time),
                      style: Theme.of(context).textTheme.bodySmall),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class CategoryDetailsCard extends StatelessWidget {
  const CategoryDetailsCard({required this.newsArticl, super.key});
  final Articles newsArticl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        color: Theme.of(context).colorScheme.onPrimary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              newsArticl.urlToImage ?? "",
              height: 230.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                newsArticl.author ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(newsArticl.title ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Text(
                      timeago
                          .format(DateTime.parse(newsArticl.publishedAt ?? "")),
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

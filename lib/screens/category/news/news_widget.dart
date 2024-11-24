import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/services.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/category/news_details_view.dart';
import 'package:news_app/screens/widgets/category_details_card.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({required this.sourceId, super.key});
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Services.getNews(sourceId),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 70.h,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return SizedBox(
              height: 70.h,
              child: Center(
                child: Text("error ${snapshot.error.toString()}"),
              ),
            );
          }
          NewsModel? sourceModel = snapshot.data;
          List<Articles>? news = sourceModel?.articles ?? [];
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                    NewsDetailsView.routeName,
                    arguments: news[index]),
                child: CategoryDetailsCard(
                  newsArticl: news[index],
                ),
              );
            },
            itemCount: news.length,
          );
        });
  }
}

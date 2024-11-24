import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/services.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/provider/Search_provider.dart';
import 'package:news_app/screens/search/search_widget.dart';
import 'package:news_app/screens/widgets/category_details_card.dart';
import 'package:news_app/theme/app_images.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = "search";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0,
          toolbarHeight: 60.h,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButton(
                  onPressed: () {
                    Provider.of<SearchProvider>(context, listen: false)
                        .searchName(controller.text);
                  },
                  child: Text(
                    "Search",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
            ),
          ],
          title: SearchWidget(
            controller: controller,
          )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.mainBackground), fit: BoxFit.fill)),
        child: FutureBuilder(
            future: Services.searchNews(
                Provider.of<SearchProvider>(context, listen: false).search ??
                    ""),
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
              if (news.isEmpty && controller.text.isNotEmpty) {
                return Center(
                  child: Text(
                    "Not Found",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CategoryDetailsCard(
                    newsArticl: news[index],
                  );
                },
                itemCount: news.length,
              );
            }),
      ),
    );
  }
}

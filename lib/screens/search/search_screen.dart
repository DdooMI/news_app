import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/provider/Search_provider.dart';
import 'package:news_app/screens/category/news_details_view.dart';
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
    final searchProvider = Provider.of<SearchProvider>(context);
    List<Articles> news = searchProvider.articles;

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
                    searchProvider.searchName(controller.text);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.search,
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
                  image: AssetImage(AppImages.mainBackground),
                  fit: BoxFit.cover)),
          child: searchProvider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : news.isEmpty
                  ? Center(
                      child: Text(
                        AppLocalizations.of(context)!.notFound,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 25),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListView.builder(
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
                      ),
                    )),
    );
  }
}

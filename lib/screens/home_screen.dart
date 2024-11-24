import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/category/categories_screen.dart';
import 'package:news_app/screens/category/category_details.dart';
import 'package:news_app/screens/search/search_screen.dart';
import 'package:news_app/screens/settings/settings_screen.dart';
import 'package:news_app/screens/widgets/custom_drawer.dart';
import 'package:news_app/theme/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectScreen = DrawerItem.categories;
  CategoryModel? selectedCate;
  Articles? selectedNews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        onSelect: (p0) {
          selectScreen = p0;
          selectedCate = null;
          selectedNews = null;
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: selectedCate != null
            ? Text(selectedCate!.title)
            : selectScreen == DrawerItem.settings
                ? const Text("Settings")
                : const Text("News App"),
        actions: selectedCate != null
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SearchScreen.routeName);
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ]
            : null,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.mainBackground), fit: BoxFit.fill)),
        child: selectedCate != null
            ? CategoryDetails(id: selectedCate!.id)
            : selectScreen == DrawerItem.categories
                ? CategoriesScreen(
                    onSelect: (p0) {
                      selectedCate = p0;

                      setState(() {});
                    },
                  )
                : const SettingsScreen(),
      ),
    );
  }
}

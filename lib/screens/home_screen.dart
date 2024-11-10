import 'package:flutter/material.dart';
import 'package:news_app/screens/category/categories_screen.dart';
import 'package:news_app/screens/category/category_details.dart';
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
  String? selectedCateId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        onSelect: (p0) {
          selectScreen = p0;
          selectedCateId = null;
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.mainBackground), fit: BoxFit.fill)),
        child: selectedCateId != null
            ? CategoryDetails(id: selectedCateId!)
            : selectScreen == DrawerItem.categories
                ? CategoriesScreen(
                    onSelect: (p0) {
                      selectedCateId = p0;

                      setState(() {});
                    },
                  )
                : const SettingsScreen(),
      ),
    );
  }
}

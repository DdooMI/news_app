import 'package:flutter/material.dart';
import 'package:news_app/screens/category/categories_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        onSelect: (p0) {
          selectScreen = p0;
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
        child: selectScreen == DrawerItem.categories
            ? const CategoriesScreen()
            : const SettingsScreen(),
      ),
    );
  }
}

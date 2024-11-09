import 'package:flutter/material.dart';
import 'package:news_app/screens/widgets/custom_list_tile.dart';
import 'package:news_app/theme/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({required this.onSelect, super.key});
  final Function(DrawerItem) onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 320,
        child: Column(
          children: [
            Container(
              height: 150,
              color: AppColors.primary,
              alignment: Alignment.center,
              child: Text(
                "News App!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            CustomListTile(
                onTap: () => onSelect(DrawerItem.categories),
                leading: const Icon(
                  Icons.list,
                  size: 30,
                ),
                title: "Categories"),
            CustomListTile(
                onTap: () => onSelect(DrawerItem.settings),
                leading: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                title: "Settings")
          ],
        ),
      ),
    );
  }
}

enum DrawerItem { categories, settings }

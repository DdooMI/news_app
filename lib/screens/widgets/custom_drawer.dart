import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/screens/widgets/custom_list_tile.dart';
import 'package:news_app/theme/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({required this.onSelect, super.key});
  final Function(DrawerItem) onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: SizedBox(
        width: 320,
        child: Column(
          children: [
            Container(
              height: 150,
              color: AppColors.primary,
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.newsApp,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            CustomListTile(
                onTap: () => onSelect(DrawerItem.categories),
                leading: Icon(
                  Icons.list,
                  size: 30,
                  color: Theme.of(context).colorScheme.surface,
                ),
                title: AppLocalizations.of(context)!.categories),
            CustomListTile(
                onTap: () => onSelect(DrawerItem.settings),
                leading: Icon(
                  Icons.settings,
                  size: 30,
                  color: Theme.of(context).colorScheme.surface,
                ),
                title: AppLocalizations.of(context)!.setings)
          ],
        ),
      ),
    );
  }
}

enum DrawerItem { categories, settings }

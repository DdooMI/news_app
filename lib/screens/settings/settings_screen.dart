import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/dark_provider.dart';
import 'package:news_app/provider/localization_provider.dart';
import 'package:news_app/screens/widgets/custom_listTile_settings_widget.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListtileSettingsWidget(
            title: AppLocalizations.of(context)!.darkMode,
            trailing: Switch(
                trackOutlineColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primary),
                thumbColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primary),
                inactiveTrackColor: Theme.of(context).colorScheme.onSecondary,
                activeColor: Theme.of(context).colorScheme.primary,
                value: Provider.of<DarkProvider>(context, listen: false).isDark,
                onChanged: (value) {
                  Provider.of<DarkProvider>(context, listen: false)
                      .changeThemeMode(
                          value ? ThemeMode.dark : ThemeMode.light);
                })),
        CustomListtileSettingsWidget(
            title: AppLocalizations.of(context)!.language,
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text(AppLocalizations.of(context)!.english,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text(AppLocalizations.of(context)!.arabic,
                          style: Theme.of(context).textTheme.bodyMedium),
                    )
                  ],
                  iconEnabledColor: Theme.of(context).colorScheme.onSecondary,
                  dropdownColor: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                  underline: Container(),
                  value:
                      Provider.of<LocalizationProvider>(context, listen: false)
                          .appLocal,
                  style: Theme.of(context).textTheme.titleSmall,
                  onChanged: (value) {
                    if (value != null) {
                      Provider.of<LocalizationProvider>(context, listen: false)
                          .changeLocal(value);
                    }
                  }),
            )),
      ],
    );
  }
}

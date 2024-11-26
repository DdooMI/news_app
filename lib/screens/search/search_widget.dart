import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({required this.controller, super.key, this.onPressed});
  final TextEditingController? controller;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: controller,
        cursorHeight: 25.h,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 25,
            ),
            hintText: "${AppLocalizations.of(context)!.search}....",
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 18, color: Theme.of(context).colorScheme.onSecondary),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondary),
                borderRadius: BorderRadius.circular(20)),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondary),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondary),
                borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondary),
                borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onSecondary),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}

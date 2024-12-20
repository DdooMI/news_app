import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  CustomListTile(
      {required this.leading,
      required this.title,
      required this.onTap,
      super.key});
  Widget leading;
  String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap!();
        Navigator.of(context).pop();
      },
      leading: leading,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 30,
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}

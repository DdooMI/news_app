import 'package:flutter/material.dart';
import 'package:news_app/screens/category/source/source_choice_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.id});
  final String id;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SourceChoiceWidget(categoryId: widget.id),
      ],
    );
  }
}

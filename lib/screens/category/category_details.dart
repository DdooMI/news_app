import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/category/category_details_card.dart';
import 'package:news_app/screens/category/source/source_choice_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.id});
  final String id;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List news = List.generate(
      5,
      (index) => NewsModel(
          id: index.toString(),
          title: "Why are football's biggest clubs starting a new tournament?",
          publisher: "BBC news",
          time: DateTime.now(),
          image: "assets/NewsTest.png"));
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SourceChoiceWidget(categoryId: widget.id),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CategoryDetailsCard(
              newsModel: news[index],
            );
          },
          itemCount: 5,
        )
      ],
    );
  }
}

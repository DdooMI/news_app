import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/services.dart';
import 'package:news_app/models/sources_model.dart';
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
    return FutureBuilder(
        future: Services.getSources(widget.id),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 70.h,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return SizedBox(
              height: 70.h,
              child: Center(
                child: Text("error ${snapshot.error.toString()}"),
              ),
            );
          }
          SourceModel? sourceModel = snapshot.data;
          List<Sources>? sources = sourceModel?.sources ?? [];

          return SourceChoiceWidget(
            sources: sources,
          );
        });
  }
}

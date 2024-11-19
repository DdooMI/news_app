import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/services.dart';
import 'package:news_app/models/sources_model.dart';
import 'package:news_app/theme/app_colors.dart';

class SourceChoiceWidget extends StatefulWidget {
  const SourceChoiceWidget({required this.categoryId, super.key});
  final String categoryId;

  @override
  State<SourceChoiceWidget> createState() => _SourceChoiceWidgetState();
}

class _SourceChoiceWidgetState extends State<SourceChoiceWidget> {
  String? selectedSubCatId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Services.getSources(widget.categoryId),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 70.h,
              child: const Center(
                child: Expanded(child: CircularProgressIndicator()),
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
          if (selectedSubCatId == null && sources.isNotEmpty) {
            selectedSubCatId = sources[0].id;
          }
          return SizedBox(
            height: 70.h,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  child: ChoiceChip(
                    onSelected: (value) {
                      selectedSubCatId = sources[index].id;
                      setState(() {});
                    },
                    label: Text(sources[index].name ?? ''),
                    selected: sources[index].id == selectedSubCatId,
                    showCheckmark: false,
                    labelStyle: sources[index].id == selectedSubCatId
                        ? Theme.of(context).textTheme.bodyMedium
                        : null,
                    selectedColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        side: BorderSide(color: AppColors.primary)),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: sources.length,
            ),
          );
        });
  }
}

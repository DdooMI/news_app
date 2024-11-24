import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/sources_model.dart';
import 'package:news_app/screens/category/news/news_widget.dart';
import 'package:news_app/theme/app_colors.dart';

class SourceChoiceWidget extends StatefulWidget {
  const SourceChoiceWidget({super.key, required this.sources});
  final List<Sources> sources;

  @override
  State<SourceChoiceWidget> createState() => _SourceChoiceWidgetState();
}

class _SourceChoiceWidgetState extends State<SourceChoiceWidget> {
  String? selectedSource;
  Articles? selectedNews;
  @override
  void initState() {
    selectedSource = widget.sources.isNotEmpty ? widget.sources[0].id : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 70.h,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: ChoiceChip(
                  onSelected: (value) {
                    selectedSource = widget.sources[index].id;
                    setState(() {});
                  },
                  label: Text(widget.sources[index].name ?? ''),
                  selected: widget.sources[index].id == selectedSource,
                  showCheckmark: false,
                  labelStyle: widget.sources[index].id == selectedSource
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
            itemCount: widget.sources.length,
          ),
        ),
        if (selectedSource != null) NewsWidget(sourceId: selectedSource!)
      ],
    );
  }
}

import 'package:flutter/material.dart';
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
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: controller,
        cursorHeight: 25.h,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            hintText: "Search....",
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 18, color: const Color(0xFF6B6B6B)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}

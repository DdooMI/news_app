import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String? search;
  searchName(String name) {
    search = name;
    notifyListeners();
  }
}

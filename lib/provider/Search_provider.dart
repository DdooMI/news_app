import 'package:flutter/material.dart';
import 'package:news_app/api/services.dart';
import 'package:news_app/models/news_model.dart';

class SearchProvider extends ChangeNotifier {
  String? search;
  bool isLoading = false;
  List<Articles> articles = [];
  searchName(String name) {
    search = name;
    if (search != null && search!.isNotEmpty) {
      getSearchArticles(search!);
    } else {
      articles.clear();
      notifyListeners();
    }
  }

  Future<void> getSearchArticles(String searchQ) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await Services.searchNews(searchQ);

      articles = response.articles ?? [];
    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }
}

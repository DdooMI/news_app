import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_consts.dart';
import 'package:news_app/models/sources_model.dart';

class Services {
  static Future<SourceModel> getSources(String categoryId) async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.sourceEndpoint,
        {'apiKey': ApiConsts.apiKey, 'category': categoryId});
    var response = await http.get(url);
    String body = response.body;
    var json = jsonDecode(body);
    return SourceModel.fromJson(json);
  }
}

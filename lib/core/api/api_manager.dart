import 'dart:convert';
import 'package:akhbar/core/api/api_constants.dart';
import 'package:akhbar/core/api/endpoints.dart';
import 'package:akhbar/models/ArticlesResponse.dart';
import 'package:akhbar/models/SourcesResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  /// Get Sources -> home screen
  static Future<SourcesResponse?> getSources({categoryId}) async {
    Uri uri = Uri.https(ApiConstants.baseUrl, Endpoints.sources, {
      ApiConstants.keyCountry: 'us',
      ApiConstants.keyCategory: categoryId,
      ApiConstants.keyApiKey: ApiConstants.apiKey,
    });
    print(uri);
    try {
      var res = await http.get(uri);
      var bodyString = res.body;
      var json = jsonDecode(bodyString);
      var obj = SourcesResponse.fromJson(json);
      return obj;
    } catch (e) {
      throw e;
    }
  }

  /// Get Articles -> home screen
  static Future<ArticlesResponse?> getArticles(String sourceId, query) async {
    Uri uri = Uri.https(ApiConstants.baseUrl, Endpoints.articles, {
      ApiConstants.keySources: sourceId,
      ApiConstants.keyQuery: query,
      ApiConstants.keyApiKey: ApiConstants.apiKey,
    });
    try {
      var res = await http.get(uri);
      var bodyString = res.body;
      var json = jsonDecode(bodyString);
      var obj = ArticlesResponse.fromJson(json);
      return obj;
    } catch (e) {
      throw e;
    }
  }
}

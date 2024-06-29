import 'dart:convert';
import 'package:akhbar/core/api/api_constants.dart';
import 'package:akhbar/core/api/endpoints.dart';
import 'package:akhbar/models/SourcesResponse.dart';
import 'package:http/http.dart' as http;


class ApiManager {
  /// Get Sources
  static Future<SourcesResponse?> getSources() async{
    Uri uri = Uri.https(ApiConstants.baseUrl, Endpoints.sources, {
      ApiConstants.keyCountry: 'us',
      ApiConstants.keyApiKey: ApiConstants.apiKey,

    });
    try {
      var res = await http.get(uri);
      var bodyString = res.body;
      var json = jsonDecode(bodyString);
      var obj = SourcesResponse.fromJson(json);
      return obj;
    } catch (e) {
      print("====get sources");
      throw e;
    }
  }
  ///

  ///
}
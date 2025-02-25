import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_two/api/api_constants.dart';
import 'package:news_app_two/api/end_points.dart';
import 'package:news_app_two/model/NewsResponse.dart';
import 'package:news_app_two/model/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    try {
      var response = await http.get(url);

      var bodyString = response.body;

      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
    //object
    // SourceResponse.fromJson(jsonDecode(response.body));
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=978b3429adfe40489f4b109207b1aec6
   */
  static Future<NewsResponse?> getNewsSourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> searchNews({required String searchQuery
    , required int pageNumber}) async {
    Uri url = Uri.https(ApiConstants.baseUrl,
        ApiConstants.everythingRoute,
        {
      'apiKey': ApiConstants.apiKey,
      'q': searchQuery,
      'page': pageNumber.toString(),
      'pageSize': 10
    });
    try {
      var response = await http.get(url,
          headers: {"Authorization": "Bearer ${ApiConstants.apiKey}"});
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}

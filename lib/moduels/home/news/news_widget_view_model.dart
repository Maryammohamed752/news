import 'package:flutter/material.dart';
import 'package:news_app_two/api/api_manager.dart';
import 'package:news_app_two/model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsSourceId(sourceId);
      if (response!.status == 'error') {
        errorMessage = response!.message!;
      } else {
        newsList = response!.articles!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}

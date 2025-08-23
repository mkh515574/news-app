import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/features/news/model/SourceResponse.dart';

import '../../../features/news/model/news_response.dart';
import 'app_constants.dart';
import 'endpoints.dart';

class ApiManager {
  static Future<SourceResponse> getSources( String categoryId) async {
    Uri url = Uri.https(AppConstants.baseUrl, EndPoints.sourcesApi, {
      "apiKey": AppConstants.apiKey,
      "lang": AppConstants.lang,
      "category" : categoryId
    });

    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId,String pageNumbers) async {

    Uri url=Uri.https(AppConstants.baseUrl,
        EndPoints.newsApi,
        {
          "apiKey" :AppConstants.apiKey,
          "sources":sourceId,
          'page': pageNumbers,
          'pageSize': '5',
        });
    try{
      var response=await  http.get(url);
      var responseBody=response.body;
      var json=jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }catch(e){
      rethrow ;
    }

  }


  static Future<NewsResponse> getNewsBySearch(String searchByUser) async {
    //https://newsapi.org/v2/everything?q=searchIn&apiKey=b5e58c9b906345cbbbd44b1a997d1e6c
    Uri url = Uri.https(AppConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': AppConstants.apiKey,
      'q': searchByUser,
      'searchIn': 'title',
    });
    try {
      var response = await http.get(url);

      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}

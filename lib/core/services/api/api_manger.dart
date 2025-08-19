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
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {

    Uri url=Uri.https(AppConstants.baseUrl,
        EndPoints.newsApi,
        {
          "apiKey" :AppConstants.apiKey,
          "sources":sourceId
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
}

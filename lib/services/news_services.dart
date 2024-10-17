import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/constants/constants.dart';

class NewsService {
  final Dio _dio = Dio(
      BaseOptions(baseUrl: ApiUrls.baseUrl, responseType: ResponseType.json));

  fetchNews() async {
    // final apiKey = dotenv.get('NEWS_API_KEY', fallback: "");
    // if (apiKey.isEmpty) { 
    //   throw Exception("API key is missing!");
    // }
    try {
      var response = await _dio.get(
        'v2/top-headlines?country=us',
        options: Options(headers: {
          'X-Api-Key': "dd1b5c0314cc46e784a9296c3cd42136",
        }),
      );
      return response.data;
    } catch (e) {
      // Handle errors appropriately
      if (kDebugMode) {
        print("Error fetching news: $e");
      }
      rethrow;
    }
  }

  fetchNewsBySearching(String title) async {
    // final apiKey = dotenv.get('NEWS_API_KEY', fallback: "");

    // if (apiKey.isEmpty) {
    //   throw Exception("API key is missing!");
    // }
    try {
      var response = await _dio.get(
        'v2/everything?q=$title',
        options: Options(headers: {
          'X-Api-Key': "dd1b5c0314cc46e784a9296c3cd42136",
        }),
      );
      return response.data;
    } catch (e) {
      // Handle errors appropriately
      if (kDebugMode) {
        print("Error searching for news: $e");
      }
      rethrow;
    }
  }
}

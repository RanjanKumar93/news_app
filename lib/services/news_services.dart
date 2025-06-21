import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/constants/constants.dart';

class NewsService {
  final Dio _dio = Dio(
      BaseOptions(baseUrl: ApiUrls.baseUrl, responseType: ResponseType.json));

  fetchNews() async {
    final apiKey = dotenv.env['NEWS_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) { 
      throw Exception("API key is missing! Please check your .env file.");
    }
    
    try {
      var response = await _dio.get(
        'v2/top-headlines?country=us',
        options: Options(headers: {
          'X-Api-Key': apiKey,
        }),
      );
      debugPrint("Response: ${response.data}");
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
    final apiKey = dotenv.env['NEWS_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception("API key is missing! Please check your .env file.");
    }
    
    try {
      var response = await _dio.get(
        'v2/everything?q=$title',
        options: Options(headers: {
          'X-Api-Key': apiKey,
        }),
      );
      debugPrint("Search Response: ${response.data}");
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
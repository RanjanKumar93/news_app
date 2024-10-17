import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_services.dart';

part 'news_provider.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(true) bool isLoading,
    @Default(false) bool isError,
    required NewsModel newsModel,
  }) = _NewsState;

  const NewsState._();
}

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier() : super(NewsState(newsModel: NewsModel(articles: []))) {
    loadNews();
  }

  loadNews() async {
    state = state.copyWith(isLoading: true, isError: false);
    try {
      final newsResponse = await NewsService().fetchNews();
      final news = NewsModel.fromJson(newsResponse);
      state = state.copyWith(newsModel: news, isLoading: false);
    } catch (e) {
      state = state.copyWith(isError: true, isLoading: false);
    }
  }

  loadSearchedNews(String title) async {
    state = state.copyWith(isLoading: true, isError: false);
    try {
      final newsResponse = await NewsService().fetchNewsBySearching(title);
      final news = NewsModel.fromJson(newsResponse);
      state = state.copyWith(newsModel: news, isLoading: false);
    } catch (e) {
      state = state.copyWith(isError: true, isLoading: false);
    }
  }
}

final newsProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) => NewsNotifier());

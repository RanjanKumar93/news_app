import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:news_app/widgets/search_field.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsProvider);

    final NewsModel news = newsState.newsModel;
    final bool isLoading = newsState.isLoading;
    final bool isError = newsState.isError;
    return Scaffold(
      backgroundColor: const Color.fromARGB(110, 96, 103, 132),
      body: SafeArea(
          child: Column(
        children: [
          const SearchField(),
          isError
              ? const Center(
                  child: Text(
                    "Failed to load data",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : isLoading
                  ? Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : Expanded(
                      child: news.articles?.isEmpty ?? true
                          ? const Center(child: Text("No data available"))
                          : ListView.builder(
                              itemCount: news.articles!.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return NewsCard(article: news.articles![index]);
                              },
                            ),
                    )
        ],
      )),
    );
  }
}

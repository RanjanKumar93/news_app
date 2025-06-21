import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends StatelessWidget {
  final Article article;

  const NewsDetailPage({super.key, required this.article});

  String formatPublishedDate(String? isoDate) {
    if (isoDate == null) return '';
    final dateTime = DateTime.tryParse(isoDate);
    if (dateTime == null) return '';
    return timeago.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source?.name ?? "News"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: article.urlToImage != null &&
                      article.urlToImage!.startsWith('http')
                  ? Image.network(
                      article.urlToImage!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/placeholder.png',
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 12),
            Text(
              article.title ?? "No Title",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "By ${article.author ?? 'Unknown'} • ${formatPublishedDate(article.publishedAt)}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              article.content ?? article.description ?? "No content available.",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final url = article.url;
                if (url != null && await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url),
                      mode: LaunchMode.externalApplication);
                }
              },
              child: const Text("Read full article"),
            ),
          ],
        ),
      ),
    );
  }
}

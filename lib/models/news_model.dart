class NewsModel {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: (json['articles'] as List)
          .map((articleJson) => Article.fromJson(articleJson))
          .toList(),
    );
  }
}

class Article {
  final Source? source;
  final String? title;
  final String? author;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? 'Unknown',
      title: json['title'],
      description: json['description'] ?? '',
      url: json['url'],
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'],
      content: json['content'] ?? '',
    );
  }
}

class Source {
  final String id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown',
    );
  }
}

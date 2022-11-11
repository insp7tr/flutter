import 'dart:convert';

import 'package:news_app/models/article.dart';
import 'package:news_app/models/article_category.dart';
import 'package:news_app/private.dart';
import 'package:http/http.dart' as http;

class NewsAPI {
  const NewsAPI();

  static const baseURL = "https://newsapi.org/v2";
  static const apiKey = PrivateVariables.apiKey;

  Future<List<Article>> fetchArticles(ArticleCategory category) async {
    var url =
        '$baseURL/top-headlines?apiKey=$apiKey&language=en&category=${categoryQueryParamValue(category)}';

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json['status'] == 'ok') {
        final dynamic articlesJSON = json['articles'] ?? [];

        final List<Article> articles =
            articlesJSON.map<Article>((e) => Article.fromMap(e)).toList();

        return articles;
      } else {
        throw Exception(json['message'] ?? "Failed to load articles");
      }
    } else {
      throw Exception("Bad Response - Failed to load articles");
    }
  }

  String categoryQueryParamValue(ArticleCategory category) {
    switch (category) {
      case ArticleCategory.general:
        return 'general';
      case ArticleCategory.business:
        return 'business';
      case ArticleCategory.technology:
        return 'technology';
      case ArticleCategory.entertainment:
        return 'entertainment';
      case ArticleCategory.sports:
        return 'sports';
      case ArticleCategory.science:
        return 'science';
      case ArticleCategory.health:
        return 'health';
      default:
        return 'general';
    }
  }
}

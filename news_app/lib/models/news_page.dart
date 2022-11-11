// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluent_ui/fluent_ui.dart';

import 'package:news_app/models/article_category.dart';

class NewsPage {
  final String title;
  final IconData iconData;
  final ArticleCategory category;

  NewsPage({
    required this.title,
    required this.iconData,
    required this.category,
  });
}

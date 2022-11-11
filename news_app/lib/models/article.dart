// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:timeago/timeago.dart' as timeago;

class Article {
  final String title;
  final String uri;
  final DateTime publishedAt;
  final String source;
  final String? urlToImage;

  Article({
    required this.title,
    required this.uri,
    required this.publishedAt,
    required this.source,
    this.urlToImage,
  });

  String captionText() {
    final formattedPublishedAt =
        timeago.format(publishedAt, locale: 'en_short');

    return '$source $formattedPublishedAt';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'uri': uri,
      'publishedAt': publishedAt.millisecondsSinceEpoch,
      'source': source,
      'urlToImage': urlToImage,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] as String,
      uri: map['url'] as String,
      publishedAt: DateTime.tryParse(map['publishedAt']) ?? DateTime.now(),
      source: map['source']['name'] as String,
      urlToImage:
          map['urlToImage'] != null ? map['urlToImage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);
}

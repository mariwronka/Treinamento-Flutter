import 'dart:convert';

import 'package:exercicio7start/models/news.model.dart';
import 'package:flutter/material.dart';

class Api {
  static Future<List<News>> retrieveLocalNews(BuildContext context) async {
    final String json = await DefaultAssetBundle.of(context)
        .loadString('assets/data/feed_data.json');

    final dynamic data = JsonDecoder().convert(json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    List<News> newsList = <News>[];
    data['news'].forEach((value) {
      if (value is Map) {
        News newsItem = News.fromJson(value);
        newsList.add(newsItem);
      }
    });

    return newsList;
  }
}
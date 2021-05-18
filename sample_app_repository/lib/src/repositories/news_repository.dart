import 'dart:async';
import 'dart:core';
import '../enities/news_enity.dart';

abstract class NewsRepository {
  Future<List<NewsEnity>> fetchHotNews();
  Future<List<NewsEnity>> fetchLocalNews();
}

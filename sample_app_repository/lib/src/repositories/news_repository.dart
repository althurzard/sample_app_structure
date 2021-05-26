import 'dart:async';
import 'dart:core';
import 'package:go_networking_service/go_networking_service.dart';

import '../enities/news_enity.dart';

abstract class NewsRepository {
  Future<ResponseListData<NewsEnity>> fetchHotNews();
  Future<ResponseListData<NewsEnity>> fetchLocalNews();
}

import 'package:flutter/material.dart';
import 'package:go_networking_service/go_networking_service.dart';
import 'package:sample_app_repository/src/repositories/news_repository.dart';
import 'package:dio/dio.dart';
import '../enities/news_enity.dart';

enum _Path { Hot, Local }

class _URLPathHelper {
  static String value(_Path value) {
    switch (value) {
      case _Path.Hot:
        return '/application/news/hot';
      case _Path.Local:
        return '/application/news/local';
      default:
        return '';
    }
  }
}

class NewsClient extends APIProvider implements NewsRepository {
  @override
  Future<ResponseListData<NewsEnity>> fetchHotNews() async {
    var input = DefaultInputService(path: _URLPathHelper.value(_Path.Local));
    final response = await super.request(input: input);
    var data = (response.data['data'] as List)
        .map((e) => NewsEnity.fromJson(e))
        .toList();
    return ResponseListData<NewsEnity>(() => data);
  }

  @override
  Future<ResponseListData<NewsEnity>> fetchLocalNews() {
    return Future.error(AppError(message: ''));
  }

  NewsClient(
      {@required StorageTokenProcessor storageTokenProcessor,
      @required NetworkConfigurable networkConfigurable,
      Interceptor interceptor})
      : super(
            storageTokenProcessor: storageTokenProcessor,
            networkConfiguration: networkConfigurable,
            interceptor: interceptor);
}

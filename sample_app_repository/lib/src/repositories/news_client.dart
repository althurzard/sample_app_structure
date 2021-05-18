import 'package:sample_app_core/sample_app_core.dart';
import 'package:sample_app_repository/src/repositories/news_repository.dart';
import '../enities/news_enity.dart';
import '../network_base.dart';

enum _URLPath { Hot, Local }

class _URLPathHelper {
  static String value(_URLPath value) {
    switch (value) {
      case _URLPath.Hot:
        return '/application/news/hot';
      case _URLPath.Local:
        return '/application/news/local';
      default:
        return '';
    }
  }
}

class NewsClient extends FetchClient implements NewsRepository {
  Future<List<NewsEnity>> fetchHotNews() async {
    final Uri newsUri =
        Uri.http(Configs.appDomain, _URLPathHelper.value(_URLPath.Hot));
    final newsResponse = await super.fetchData(uri: newsUri);
    return (newsResponse.data['data'] as List)
        .map((e) => NewsEnity.fromJson(e))
        .toList();
  }

  Future<List<NewsEnity>> fetchLocalNews() async {
    final Uri newsUri =
        Uri.http(Configs.appDomain, _URLPathHelper.value(_URLPath.Local));
    final newsResponse = await super.fetchData(uri: newsUri);
    return (newsResponse.data['data'] as List)
        .map((e) => NewsEnity.fromJson(e))
        .toList();
  }
}

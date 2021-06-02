import 'dart:async';
import 'package:go_networking_service/go_networking_service.dart';
import 'package:sample_app_repository/sample_app_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';
part 'news_event.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  final StorageTokenProcessor storageTokenProcessor;
  NewsBloc(
      {@required this.newsRepository, @required this.storageTokenProcessor})
      : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNews) {
      yield NewsLoading();
      yield* _fetchNews(event);
    }
  }

  Stream<NewsState> _fetchNews(FetchNews params) async* {
    try {
      var localNews = await newsRepository.fetchHotNews();
      yield NewsLoaded(hotNews: [], localNews: localNews.data);
    } on AppError catch (e, stack) {
      yield NewsError(message: e.message);
    }
  }
}

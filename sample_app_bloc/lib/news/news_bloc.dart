import 'dart:async';
import 'package:sample_app_repository/sample_app_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';
part 'news_event.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({@required this.newsRepository}) : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNews) {
      yield NewsLoading();
      yield* _fetchNews(event);
    }
  }

  Stream<NewsState> _fetchNews(FetchNews params) async* {
    try {
      final localNews = await newsRepository.fetchLocalNews();
      yield NewsLoaded(hotNews: [], localNews: localNews);
    } on DioError catch (e, stack) {
      yield NewsError(message: e.message);
    }
  }
}

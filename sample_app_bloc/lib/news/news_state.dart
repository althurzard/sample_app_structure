part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {
  final String message;

  NewsError({@required this.message});
}

class NewsLoaded extends NewsState {
  final List<NewsEnity> hotNews;
  final List<NewsEnity> localNews;

  NewsLoaded({
    @required this.hotNews,
    @required this.localNews,
  });
}

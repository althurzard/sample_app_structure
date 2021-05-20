import 'package:sample_app_bloc/sample_app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app_repository/sample_app_repository.dart';
import 'package:sample_loyalty_app/src/app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  initializeDateFormatting();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NewsBloc>(
        create: (context) => NewsBloc(newsRepository: NewsClient())),
    BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
    )
  ], child: MyApp()));
}

// Used for debug/tracking the state of the app.
class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

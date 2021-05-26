import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_app_bloc/sample_app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app_repository/sample_app_repository.dart';
import 'package:sample_loyalty_app/app_injector.dart';
import 'package:sample_loyalty_app/src/app.dart';
import 'package:intl/date_symbol_data_local.dart';

AppInjector appInjector;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appInjector = await AppInjector.create();
  Bloc.observer = AppBlocObserver();
  await initializeDateFormatting();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NewsBloc>(create: (context) {
      var client = GetIt.instance.get<NewsClient>();
      return NewsBloc(
          newsRepository: client,
          storageTokenProcessor: client.storageTokenProcessor);
    }),
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

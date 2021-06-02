import 'package:get_it/get_it.dart';
import 'package:bloc/bloc.dart';
import 'package:go_networking_service/go_networking_service.dart';
import 'package:sample_app_bloc/sample_app_bloc.dart';
import 'package:sample_app_core/sample_app_core.dart';
import 'package:sample_app_repository/sample_app_repository.dart';
import 'app_bloc_observer.dart';

class AppInjector {
  final getIt = GetIt.instance;
  StorageTokenProcessor storageTokenProcessor;
  NetworkConfigurable networkConfigurable;

  Future<void> _configureDependencies() async {
    Bloc.observer = AppBlocObserver();
    storageTokenProcessor = await DefaultStorageTokenProcessor.create();
    networkConfigurable =
        DefaultNetworkConfigurable(baseURL: Configs.appDomain);

    getIt.registerFactory<NewsClient>(() => NewsClient(
        storageTokenProcessor: storageTokenProcessor,
        networkConfigurable: networkConfigurable));

    getIt.registerFactory<NewsBloc>(() {
      var client = getIt.get<NewsClient>();
      return NewsBloc(
          newsRepository: client, storageTokenProcessor: storageTokenProcessor);
    });

    getIt.registerFactory<NativeBloc>(() {
      return NativeBloc();
    });

    getIt.registerFactory<ProfileBloc>(() {
      return ProfileBloc();
    });
  }

  static Future<AppInjector> create() async {
    var appInjector = AppInjector();
    await appInjector._configureDependencies();
    return appInjector;
  }
}

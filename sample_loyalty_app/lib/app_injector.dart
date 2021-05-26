import 'package:get_it/get_it.dart';
import 'package:go_networking_service/go_networking_service.dart';
import 'package:sample_app_core/sample_app_core.dart';
import 'package:sample_app_repository/sample_app_repository.dart';

class AppInjector {
  final getIt = GetIt.instance;
  StorageTokenProcessor storageTokenProcessor;
  NetworkConfigurable networkConfigurable;

  Future<void> _configureDependencies() async {
    storageTokenProcessor = await DefaultStorageTokenProcessor.create();
    networkConfigurable =
        DefaultNetworkConfigurable(baseURL: Configs.appDomain);
    getIt.registerFactory<NewsClient>(() {
      var client = NewsClient(
          storageTokenProcessor: storageTokenProcessor,
          networkConfigurable: networkConfigurable);
      return client;
    });
  }

  static Future<AppInjector> create() async {
    var appInjector = AppInjector();
    await appInjector._configureDependencies();
    return appInjector;
  }
}

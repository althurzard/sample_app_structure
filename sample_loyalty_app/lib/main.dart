import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_app_bloc/sample_app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_loyalty_app/app_injector.dart';
import 'package:sample_loyalty_app/src/app.dart';
import 'package:intl/date_symbol_data_local.dart';

AppInjector appInjector;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appInjector = await AppInjector.create();
  await initializeDateFormatting();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NewsBloc>(create: (context) => GetIt.instance.get<NewsBloc>()),
    BlocProvider<NativeBloc>(
        create: (context) => GetIt.instance.get<NativeBloc>()),
    BlocProvider<ProfileBloc>(
        create: (context) => GetIt.instance.get<ProfileBloc>()),
  ], child: MyApp()));
}

import 'package:flutter/material.dart';
import 'package:sample_app_core/sample_app_core.dart';
import 'package:sample_loyalty_app/src/widgets/news/detail_article.dart';
import 'package:sample_loyalty_app/src/widgets/news/newsfeed_screen.dart';
import 'package:sample_loyalty_app/src/widgets/profile/profile_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App demo',
      theme: AppTheme.theme,
      supportedLocales: [Locale('en', 'US')],
      locale: Locale('en', 'US'),
      localizationsDelegates: [AppLocalizationsDelegate()],
      home: TabbarController(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.detailArticle:
        return MaterialPageRoute(builder: (_) => DetailArticle());
        break;
    }
    return MaterialPageRoute(builder: (_) => Container());
  }
}

class TabbarController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              NewsScreen(),
              Profile(),
            ],
          ),
        ),
      ),
    );
  }
}
